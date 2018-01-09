        //variables        
        var mycanvas=null; //the hidden canvas cannot be defined yet
        var ctx = null; //the hidden context cannot be defined yet
        var mycanvas2=null; //the canvas displaying the game cannot be defined yet
        var ctx2 = null; //the context displaying the game cannot be defined yet
        var real_width=300; //real width of the canvas
        var real_height=300; //real height of the canvas
		var canvas_ratio=real_width/real_height; //ratio of the real canvas
		var dot_mouse={x:real_width/2,y:real_height/2}; //coordinates of the mouse in the real canvas
        //definition des media à charger en cache
        var medias={
            files:['fond.jpg','ball.png','cpu_board.png','player_board.png','cpu_cursor.png','arrow_left.png','arrow_right.png','win.png','lose.png','vortex.png','message_start.png'],
            folder:'img/',
            medias:[],
            loaded:0
        };
        var deg=Math.PI/180;
        var img_fond=new Image();
        var img_cpu_board=new Image();
        var img_player_board=new Image();
        var img_cpu_cursor=new Image();
        var img_arrow_left=new Image();
        var img_arrow_right=new Image();
        var img_loader=new Image();
        var img_board_win=new Image();
        var img_board_lose=new Image();
        var img_vortex=new Image();
		var img_board_start=new Image();
        var phase_jeu="none";//aucune phase de jeu définie
        var n=100;//nb de balles
        var dn=10; //nb de divisions de la grille de répartition
        var rball=3.5; //rayon de la balle
        var dcontact=4*rball*rball; //distance de contact entre 2 balles au carré
        var id_current_ball=-1; //id de la balle en cours
        var id_current_explosion=-1; //id de l'explosion en cours
        var id_current_flying_message=-1; //id du message volant en cours
        var dv_explosion=1; //accélération de l'explosion
        var vmin_explosion=1; //vitesse initiale de l'explosion
        var k_explosion=0.98; //frottement de l'explosion
        var rmax_explosion=20; //rayon max de l'explosion
        var vdisipate_explosion=0.01; //vitesse de dissipation de l'explosion
        var zone_width=300; // largeur de la zone
        var zone_height=300; //hauteur de la zone
        var xmin=rball;//xmin de la zone
        var ymin=rball;//ymin de la zone
        var xmax=zone_width-rball;//xmax de la zone
        var ymax=zone_height-rball;//ymax de la zone
        var dxcell=zone_width/dn;// largeur d'une cellule de la grille de répartition
        var dycell=zone_height/dn;// hauteur d'une cellule de la grille de répartition
        var balls=[];//conteneur des balles
        var explosions=[]; //conteneur des explosions
        var flying_messages=[]; //conteneur des messages volants
        var nb_iter=0;//nombre d'iteration effectuée
        var score=[0,0];//score nul au départ player et CPU
        var block_click=1;
        var vortex={mode:0,r:0,x:150,y:150};        
        //créer la grille vide
        var cell = new Array(dn); //conteneur de la grille
        for (var i = 0; i < dn; i++) {
           cell[i] = new Array(dn);
           for (var j = 0; j < dn; j++) {
                cell[i][j]=new Array(0);                
           }
        }
        var reaction_now=0;
        //game against CPU
        var the_player=0;
        var playing_cpu=0;
        var phase_cpu="wait";
        var x_cpu_cursor=310;
        var y_cpu_cursor=310;
        var vx_cpu_cursor=0;
        var vy_cpu_cursor=0;
        var nx_cpu=0;
        var ny_cpu=0;
        var xgoal_cpu=310;
        var ygoal_cpu=310;
        var t_rest_cpu=0;
        var player_clicked=0; //joueur qui a cliqué
        var networks=[];
        var postedscore=0;

        //my random function
		  function my_random() {
			var xrand = Math.sin(random_seed++) * 10000;
			return xrand - Math.floor(xrand);
		  }
         //poste le score
         function post_score(my_score){
            URL_POST=URL_POST_SCORE+"&score="+my_score;
            if(MODE_DEBUG==1){
               alert("POST:"+URL_POST);
            }
            var oReq = new XMLHttpRequest();
            oReq.addEventListener("load", callbackscore);
            oReq.open("GET", URL_POST);
            oReq.send();
        }
        //callback score
        function callbackscore(){
            if(MODE_DEBUG==1){
                alert("callback:"+this.responseText);
            }
            setTimeout(leave_page,3000);
        }
        //change de page
        function leave_page(){
            if(MODE_DEBUG==1){
                alert("quitte la page au bout de 3s");
            }
            location.replace(URL_END);
        }
       //classe de la balle
       function ball(){
          id_current_ball++;
          this.id=id_current_ball;
          this.alive=1;
          this.img = new Image();
          this.img.src = 'img/ball.png';          
          this.x=my_random()*xmax;
          this.y=my_random()*ymax;
          this.xcell=Math.floor(dn*this.x/zone_width);
          this.ycell=Math.floor(dn*this.y/zone_height);
          cell[this.xcell][this.ycell].push(this.id);
          this.vx=(my_random()-my_random())*4;
          this.vy=(my_random()-my_random())*4;
          this.id_network=-1;
          this.explode= function (points) {
            this.alive=0;
            //enlève la balle de la grille            
            var pos=-1;
            for(var i=0;i<cell[this.xcell][this.ycell].length;i++){
                if (cell[this.xcell][this.ycell][i]==this.id) {
                    pos=i;
                }
            }
            if (pos>-1) {                
                cell[this.xcell][this.ycell].splice(pos,1);
            }
            //incrémente le score du nombre de points
            score[player_clicked]+=points;
            //crée un message volant à l'emplacement de la balle
            flying_messages.push(new flying_message(this.x-5,this.y,"+"+String(points)));
            //crée une explosion à l'emplacement de la balle
            Start_explosion(this.x,this.y,points+1);
          }
          this.move= function () {
            //enlève la balle de la grille            
            var pos=-1;
            for(var i=0;i<cell[this.xcell][this.ycell].length;i++){
                if (cell[this.xcell][this.ycell][i]==this.id) {
                    pos=i;
                }
            }
            if (pos>-1) {                
                cell[this.xcell][this.ycell].splice(pos,1);
            }
            //bouge
            this.x+=this.vx;
            this.y+=this.vy;
            if (this.x>xmax) {
                this.x=xmax;
                this.vx=-Math.abs(this.vx);            
            }
            if (this.x<xmin) {
                this.x=xmin;
                this.vx=Math.abs(this.vx);            
            }
            if (this.y>ymax) {
                this.y=ymax;
                this.vy=-Math.abs(this.vy);            
            }
            if (this.y<ymin) {
                this.y=ymin;
                this.vy=Math.abs(this.vy);            
            }
            //replace la balle dans la grille
            this.xcell=Math.floor(dn*this.x/zone_width);
            this.ycell=Math.floor(dn*this.y/zone_height);            
            cell[this.xcell][this.ycell].push(this.id);
            //teste les chocs dans la cellule
            for(i=0;i<cell[this.xcell][this.ycell].length-1;i++){
                var id_other=cell[this.xcell][this.ycell][i];
                var xx=balls[id_other].x;
                var yy=balls[id_other].y;
                var dxx=xx-this.x;
                var dyy=yy-this.y;
                var d2=dxx*dxx+dyy*dyy;
                if (d2<dcontact) {
                    //choc 
                    var rr=Math.sqrt(d2);
                    if (rr==0) {
                        rr=1;                    
                    }
                    var dux=dxx/rr;
                    var duy=dyy/rr;
                    var dwx=-duy;
                    var dwy=dux;                    
                    //enlève la balle de la grille            
                    var pos=-1;
                    for(var i=0;i<cell[this.xcell][this.ycell].length;i++){
                        if (cell[this.xcell][this.ycell][i]==this.id) {
                           pos=i;
                        }
                    }
                    if (pos>-1) {                
                        cell[this.xcell][this.ycell].splice(pos,1);
                    }
                    //rebond                    
                    this.x=xx-(2*rball+0.1)*dux;
                    this.y=yy-(2*rball+0.1)*duy;
                    if (this.x>xmax) {
                        this.x=xmax;
                        this.vx=-Math.abs(this.vx);            
                    }
                    if (this.x<xmin) {
                        this.x=xmin;
                        this.vx=Math.abs(this.vx);            
                    }
                    if (this.y>ymax) {
                        this.y=ymax;
                        this.vy=-Math.abs(this.vy);            
                    }
                    if (this.y<ymin) {
                        this.y=ymin;
                        this.vy=Math.abs(this.vy);            
                    }                    
                    //replace la balle dans la grille
                    this.xcell=Math.floor(dn*this.x/zone_width);
                    this.ycell=Math.floor(dn*this.y/zone_height);                                        
                    cell[this.xcell][this.ycell].push(this.id);
                    //conservation de la quantité de mouvement
                    var vu=this.vx*dux+this.vy*duy;
                    var vw=this.vx*dwx+this.vy*dwy;                    
                    var vuo=balls[id_other].vx*dux+balls[id_other].vy*duy;
                    var vwo=balls[id_other].vx*dwx+balls[id_other].vy*dwy;
                    var vvu=(vu+vuo)/2;
                    this.vx=-vvu*dux+vw*dwx;
                    this.vx=-vvu*duy+vw*dwy;
                    balls[id_other].vx=vvu*dux+vwo*dwx;
                    balls[id_other].vy=vvu*duy+vwo*dwy;
                    
                }
            }
          }
       }
        
       //classe de l'explosion
       function explosion(x,y,points){
          id_current_explosion++;          
          this.id=id_current_explosion;                    
          this.x=x;
          this.y=y;
          this.v=vmin_explosion;
          this.points=points;
          this.phase=0;
          this.alpha=0.5;
          this.move= function () {
             if (this.phase==0) {   
                //croitre
                this.v=k_explosion*this.v+dv_explosion;
                if (this.v>rmax_explosion) {
                    this.v=rmax_explosion;
                    this.phase=1;
                }
             }else if (this.phase==1) {
                //se dissipe                
                this.alpha-=vdisipate_explosion;
                if (this.alpha<0.1) {
                    this.alpha=0.1;
                    this.phase=2;
                }
             }
             blast(this.x,this.y,this.v,this.alpha,points);
          }
       }
       
       function blast(x,y,r,power,points) {
         xmin2=x-r;
         ymin2=y-r;
         xcellmin=Math.floor(dn*xmin2/zone_width);
         if (xcellmin<0) {
            xcellmin=0;
         }
         if (xcellmin>dn-1) {
            xcellmin=dn-1;
         }
         ycellmin=Math.floor(dn*ymin2/zone_height);
         if (ycellmin<0) {
            ycellmin=0;
         }
         if (ycellmin>dn-1) {
            ycellmin=dn-1;
         }
         xmax2=x+r;
         ymax2=y+r;
         xcellmax=Math.floor(dn*xmax2/zone_width);;
         if (xcellmax<0) {
            xcellmax=0;
         }
         if (xcellmax>dn-1) {
            xcellmax=dn-1;
         }
         ycellmax=Math.floor(dn*ymax2/zone_width);;
         if (ycellmax<0) {
            ycellmax=0;
         }
         if (ycellmax>dn-1) {
            ycellmax=dn-1;
         }
         var id_ball_to_explose=[];
         for(xx=xcellmin;xx<xcellmax+1;xx++){
           for(yy=ycellmin;yy<ycellmax+1;yy++){              
              for(it=0;it<cell[xx][yy].length;it++){
                   id_ball=cell[xx][yy][it];                   
                   xb=balls[id_ball].x;
                   yb=balls[id_ball].y;
                   dxx=xb-x;
                   dyy=yb-y;
                   d2=dxx*dxx+dyy*dyy;
                   ddr=(r+rball)*(r+rball);
                   if (d2<ddr) {
                       // si la balle est en vie                       
                       if (balls[id_ball].alive==1) {                        
                           //la balle est prise dans le souffle
                           id_ball_to_explose.push(id_ball);
                       }
                   }
              }
           }  
         }
         //fait exploser les balles prises dans le souffle
         for(i=0;i<id_ball_to_explose.length;i++){
             id_ball=id_ball_to_explose[i];
             balls[id_ball].explode(points);
         }
       }
       
       function Start_explosion(x,y,points) {           
           explosions.push(new explosion(x,y,points));
       }
       
       //classe des messages volants
       function flying_message(x,y,message){
          id_current_flying_message++;          
          this.id=id_current_flying_message;                    
          this.x=x;
          this.y=y;
          this.v=0;
          this.alive=1;
          this.message=message;          
          this.alpha=1;
          this.move= function () {               
                //monte
                this.v=this.v-0.1;              
                this.y+=this.v;
                //se dissipe                
                this.alpha-=0.01;
                if (this.alpha<0.5) {
                    this.alpha=0.5;
                    //meurt
                    this.alive=0;
                }       
          }
       } 
        
        function getMousePos(canvas, evt) {
             var rect = canvas.getBoundingClientRect();
             return {
               x: evt.clientX - rect.left,
               y: evt.clientY - rect.top
            };
        }
        
        //charge le media suivant
        function load_next_media() {
            i=medias.medias.length;                       
            if (i==medias.files.length) {
                //tous les media sont chargés on passe au jeu                
                phase_jeu='start';
                img_fond.src="img/fond.jpg";
                img_player_board.src="img/player_board.png";
                img_cpu_board.src="img/cpu_board.png";
                img_cpu_cursor.src="img/cpu_cursor.png";
                img_arrow_left.src="img/arrow_left.png";
                img_arrow_right.src="img/arrow_right.png";
                img_board_win.src="img/win.png";
                img_board_lose.src="img/lose.png";
				img_board_start.src="img/message_start.png";
                img_vortex.src="img/vortex.png";
                for(i=0;i<n;i++){
                   balls.push(new ball());
                }
                block_click=0;
            }else{
                //on charge le media suivant  
                var mytype=medias.files[i].split(".")[1];
                if ((mytype=="png")||(mytype=="jpg")) {
                    mytype="img";
                }
                
              
                switch (mytype) {
                    case "img":
                        medias.medias.push(1);
                        img_loader.src=medias.folder+medias.files[i];
                        img_loader.onload=loaded_media();
                        break;                    
                    default:
                        break;
                  
                }
            }
            
        }
        //chaque fois qu'un media est chargé
        function loaded_media(){
            medias.loaded++;
            load_next_media();
        }
        
        function init(){
          mycanvas=document.getElementById('id_canvas1'); //the hidden canvas can be defined now
            ctx = mycanvas.getContext('2d'); //the hidden context can be defined now
            mycanvas2=document.getElementById('id_canvas2'); //the canvas displaying the game can be defined now
            ctx2 = mycanvas2.getContext('2d'); //the context displaying the game can be defined now
            //listener to resize the canvas
            window.addEventListener('resize', function(evt) {
                                     resize();                                     
                                    }, false);
            //resize init
            resize();
          mycanvas2.addEventListener('click', function(evt) {
                                     //le joueur clique
									 if (phase_jeu=="start") {
                                        phase_jeu="game";
                                     }else if ((the_player==0)&&(block_click==0)) {
                                        player_clicked=0;
                                        block_click=1;
                                        var mousePos = getMousePos(mycanvas2, evt);
                                        Start_explosion(mousePos.x*mycanvas.width/mycanvas2.width,mousePos.y*mycanvas.height/mycanvas2.height,1);
                                        reaction_now=1;
                                     }
                                    }, false);
          
          
          
          //phase du jeu
          phase_jeu='loader';
          
          //chargement du prochain media
          load_next_media();             
          
          
          //function appelée en boucle
          window.requestAnimationFrame(game);
        }
        
        
        //les actions du cpu
        function do_cpu() {            
            if (phase_cpu=="go_home"){                                                    
                    xgoal_cpu=310;
                    ygoal_cpu=310;
            }
            if ((phase_cpu=="reach")||(phase_cpu=="go_home")) {
                ax_cpu=xgoal_cpu-x_cpu_cursor;
                ay_cpu=ygoal_cpu-y_cpu_cursor;
                dist_cpu=Math.sqrt(ax_cpu*ax_cpu+ay_cpu*ay_cpu);                
                if (dist_cpu>3) {                    
                    //objectif curseur CPU non atteint
                    ax_cpu=2*ax_cpu/dist_cpu;
                    ay_cpu=2*ay_cpu/dist_cpu;
                    vx_cpu_cursor=0.9*vx_cpu_cursor+ax_cpu;
                    vy_cpu_cursor=0.9*vy_cpu_cursor+ay_cpu;
                    x_cpu_cursor+=vx_cpu_cursor/2;
                    y_cpu_cursor+=vy_cpu_cursor/2;    
                }else{
                    //objectif curseur cpu atteint
                    x_cpu_cursor=xgoal_cpu;
                    y_cpu_cursor=ygoal_cpu;
                    if (phase_cpu=="reach") {
                        //cellule à cliquer atteinte
                        player_clicked=1;
                        block_click=1;                        
                        Start_explosion(xgoal_cpu,ygoal_cpu,1);
                        reaction_now=1;
                        currenttime = new Date();
                        t_rest_cpu = currenttime.getTime();                        
                        phase_cpu="rest";
                    }else if (phase_cpu=="go_home") {
                        //maison atteinte
                        phase_cpu="wait";
                    }
                }
                
            }else if (phase_cpu=="rest") {
                //attend un peu avant que le curseur rentre à la maison
                currenttime = new Date();
                t= currenttime.getTime();
                if (t-t_rest_cpu>500) {
                   //fin de l'attente d'une demie seconde / retourne à la maison
                   phase_cpu="go_home";
                }
                
            }else if (phase_cpu=="wait_to_play") {
                //attend un peu avant de jouer
                currenttime = new Date();
                t= currenttime.getTime();
                if (t-t_rest_cpu>2000) {
                   //fin de l'attente de 2  secondes / joue
                   CPU_play();
                }
            }
        }
        
		//rendu du menu de depart
		function render_start() {          
          var ctx = document.getElementById('id_canvas1').getContext('2d');          
          //efface le canvas
          ctx.clearRect(0,0,zone_width,zone_height);
		  //affiche le fond
          ctx.drawImage(img_fond,0,0,zone_width,zone_width);
		  //affiche le menu
		  ctx.drawImage(img_board_start,25,25);
		  //render from hidden canvas to the visible one
          ctx2.drawImage(mycanvas,0,0,mycanvas2.width,mycanvas2.height);
		  window.requestAnimationFrame(game);
		}
        
        //fonction principale
        function game() {            
            switch(phase_jeu){
                case('loader'):                    
                    render_loader();
                    break;
				case('start'):                    
                    render_start();
                    break;
                case('game'):
					//teste si doit reinjecter des balles
					if ((reaction_now==1)&&(explosions.length==0)&&(flying_messages.length==0)) {
						//fin de la reaction en chaine
						reaction_now=0;
						//on continue ?
						if (score[the_player]>=2000) {
							//fin du jeu
							phase_jeu="end";
						}else{
							//reinjecte les balles en ouvrant le vortex
							vortex.mode=1;
							vortex.r=0;
							vortex.x=25+my_random()*250;
							vortex.y=25+my_random()*250;
						}
					}
                    render_game();
                    break;
				case('end'):
					 render_game();
                    break;
                default:
                    break;
            }
        }
        
        //le vortex est activé
        function do_vortex() {
            switch (vortex.mode) {
                case 1:
                    vortex.r+=0.5;
                    if (vortex.r>25) {
                        vortex.r=25;
                        vortex.mode=2;
                    }
                    break;
                case 3:
                    vortex.r-=2;
                    if (vortex.r<0) {
                        vortex.r=0;
                        the_player=1-the_player;
                        block_click=0;
                        for(i=0;i<balls.length;i++){
                            vx=balls[i].x-vortex.x;
                            vy=balls[i].y-vortex.y;
                            v=Math.sqrt(vx*vx+vy*vy);
                            if (v==0) {
                              v=1;
                            }
                            balls[i].vx-=vx/v*10;
                            balls[i].vy-=vy/v*10;
                        }
                        if (the_player==1) {
                            currenttime = new Date();
                            t_rest_cpu = currenttime.getTime();                        
                            phase_cpu="wait_to_play";
                        }                        
                        vortex.mode=0;
                    }
                default:
                    break;
            }
            if (vortex.mode>0) {
                nbalive=0;
                for(i=0;i<balls.length;i++){
                    if (balls[i].alive==1) {
                        //effet sur les balles encore en vie
                        nbalive++;
                        vx=balls[i].x-vortex.x;
                        vy=balls[i].y-vortex.y;
                        v=Math.sqrt(vx*vx+vy*vy);
                        if (v==0) {
                            v=1;
                        }
                        balls[i].vx+=vx/v*0.1;
                        balls[i].vy+=vy/v*0.1;
                    }else{                    
                        if (my_random()<0.05) {
                          //la balle morte réapparait et est ejectée
                          ang=my_random()*360*deg;
                          balls[i].x=vortex.x+7*Math.cos(ang);
                          balls[i].y=vortex.y+7*Math.sin(ang);
                          balls[i].xcell=Math.floor(dn*balls[i].x/zone_width);
                          balls[i].ycell=Math.floor(dn*balls[i].y/zone_height);
                          cell[balls[i].xcell][balls[i].ycell].push(balls[i].id);
                          balls[i].vx=4*Math.cos(ang);
                          balls[i].vy=4*Math.sin(ang);
                          balls[i].alive=1;
                        }
                    
                    }
                }
                if (nbalive==balls.length) {
                    vortex.mode=3;
                }    
            }
            
           
        }
        
        function CPU_play() {                        
                        if (the_player==1) {
                            //le CPU pense et joue
                            //réinitialise les réseaux
                            console.log("-------");
                            ddd=(rmax_explosion+rball)*(rmax_explosion+rball);
                            networks=[];
                            for(i=0;i<n;i++){
                                balls[i].id_network=-1;
                            }
                            for(i=0;i<n-1;i++){
                               if (balls[i].alive==1) {
                                   for(j=i+1;j<n;j++){
                                       if (balls[j].alive==1) {
                                           dx=balls[j].x-balls[i].x;
                                           dy=balls[j].y-balls[i].y;
                                           dd=dx*dx+dy*dy;                       
                                           if (dd<ddd) {
                                               merge_network(i,j);
                                           }
                                        }
                                    }
                                }
                            }
                            //choix du reseau le plus gros
                            max_balls=0;
                            chosen_net=-1;
                            for(k=0;k<networks.length;k++){
                                if (networks[k].length>max_balls) {
                                    max_balls=networks[k].length;
                                    chosen_net=k;
                                }
                            }
                            //choix d'une balle au hasard dans le réseau selectionné
                            rnd=Math.floor(my_random()*networks[chosen_net].length);
                            id_chosen=networks[chosen_net][rnd];                            
                            xgoal_cpu=balls[id_chosen].x;
                            ygoal_cpu=balls[id_chosen].y;                    
                            phase_cpu="reach";
                        }                     
        }
        
        //rendu du loader
        function render_loader() {          
          var ctx = document.getElementById('id_canvas1').getContext('2d');          
          //efface le canvas
          ctx.clearRect(0,0,zone_width,zone_height);
         
          ctx.fillStyle = 'black';
          ctx.fillRect(30, 200, 240, 15);  
          
          ll=240*medias.loaded/medias.files.length;
          ctx.fillStyle = 'orange';
          ctx.fillRect(30, 200, ll, 15);
          
          
          
                   
          window.requestAnimationFrame(game);
        }
        
        //fusionner les réseaux ou en creer un nouveau
        function merge_network(i,j) {
            id_i=balls[i].id_network;
            id_j=balls[j].id_network;
            if ((id_i==-1)&&(id_j==-1)) {
                //nouveau réseau
                networks.push([i,j]);
                balls[i].id_network=networks.length-1;
                balls[j].id_network=networks.length-1;
                console.log("nouveau i:"+String(i)+" j:"+String(j)+" id_network:"+String(balls[i].id_network));
            }else if ((id_i>-1)&&(id_j==-1)) {
                //la balle i est deja dans un reseau mais pas la balle j
                networks[id_i].push(j);
                balls[j].id_network=id_i;
                console.log("pousse "+String(j)+" dans le reseau "+String(id_i));
            }else if ((id_j>-1)&&(id_i==-1)) {
                //la balle j est deja dans un reseau mais pas la balle i
                networks[id_j].push(i);
                balls[i].id_network=id_j;
                console.log("met "+String(i)+" dans le reseau "+String(id_j));
            }else if (id_j!=id_i) {
                //la balle i et la balle j sont deja dans un reseau alors on les fusionne si ce ne sont pas les mêmes
                //toutes les balles dans le reseau de j dont j passent dans le reseau de i
                console.log("vide le contenu du réseau "+String(id_j)+" dans le réseau "+String(id_i));
               for(k=0;k<networks[id_j].length;k++){
                    id_balle=networks[id_j][k];
                    networks[id_i].push(id_balle);                    
                    balls[id_balle].id_network=id_i;
                    console.log("dont "+String(id_balle));
                }
                networks[id_j]=[];
            }
        }
        
        
        //rendu à chaque itération
        function render_game() {
          var ctx = document.getElementById('id_canvas1').getContext('2d');
          
          
          //efface le canvas
          ctx.globalAlpha=1;
          ctx.clearRect(0,0,zone_width,zone_height);
          //fond
          ctx.drawImage(img_fond,0,0,zone_width,zone_width);
          nb_iter++;                    
          //vortex
          if (vortex.mode>0) {
            do_vortex();
            ctx.drawImage(img_vortex,vortex.x-vortex.r,vortex.y-vortex.r,2*vortex.r,2*vortex.r);
          }
          // Balles mouvements
          ctx.globalAlpha=1;
          for(i=0;i<n;i++){
            if (balls[i].alive==1) {                      
               balls[i].move();                            
            }
          }
          //réseaux de propagation
          ctx.strokeStyle='yellow';
          ctx.lineWidth=2;
          ddd=(rmax_explosion+rball)*(rmax_explosion+rball);
          ctx.beginPath();                    
          for(i=0;i<n-1;i++){
            if (balls[i].alive==1) {
                for(j=i+1;j<n;j++){
                    if (balls[j].alive==1) {
                       dx=balls[j].x-balls[i].x;
                       dy=balls[j].y-balls[i].y;
                       dd=dx*dx+dy*dy;                       
                       if (dd<ddd) {                          
                          ctx.moveTo(balls[i].x,balls[i].y);
                          ctx.lineTo(balls[j].x,balls[j].y);
                       }
                    }
                }
            }
          }
          ctx.stroke();
          // Balles tracés          
          for(i=0;i<n;i++){
            if (balls[i].alive==1) {                                     
               ctx.drawImage(balls[i].img,balls[i].x-rball,balls[i].y-rball,2*rball,2*rball);               
            }
          }
          
          //explosions          
          var nn=explosions.length;
          var i=0;
          while (i<nn) {                      
            explosions[i].move();            
            ctx.beginPath();
            ctx.globalAlpha = explosions[i].alpha;
            ctx.arc(explosions[i].x, explosions[i].y, explosions[i].v, 0, 2 * Math.PI, false);
            if (the_player==0) {
               ctx.fillStyle = 'blue';
            }else{
               ctx.fillStyle = 'red';
            }
            ctx.fill();
            
            if (explosions[i].phase==2) {
                //detruit l'objet et reste sur place dans le tableau
                explosions[i]=null;
                explosions.splice(i,1);                
                nn--;
            }else{
                //passe au suivant
                i++;
            }
          }          
          
          //messages volant
          ctx.font = "bold 15px Arial";
          if (the_player==0) {
            ctx.fillStyle = 'blue';
          }else{
            ctx.fillStyle = 'red';
          }
          
          var nn=flying_messages.length;
          var i=0;
          while (i<nn) {                      
            flying_messages[i].move();                        
            ctx.globalAlpha = flying_messages[i].alpha;
            ctx.fillText(flying_messages[i].message,flying_messages[i].x,flying_messages[i].y);
            if (flying_messages[i].alive==0) {
                //detruit l'objet et reste sur place dans le tableau
                flying_messages[i]=null;
                flying_messages.splice(i,1);                
                nn--;
            }else{
                //passe au suivant
                i++;
            }
          }
          
          
          
          //scores
          ctx.globalAlpha=1;
          ctx.font = "14px Arial";          
          currenttime = new Date();
          t = currenttime.getTime()/100;
          dpos=20*Math.cos(t);
          //score player
          ctx.fillStyle = 'yellow';
          ctx.drawImage(img_player_board,1,272,61,27);          
          ctx.fillText(String(score[0]),5,284,50);
          if ((the_player==0)&&(block_click==0)&&(phase_jeu=="game")) {
            ctx.drawImage(img_arrow_left,62+10+dpos,283,18,15);
          }
          //score computer          
          ctx.drawImage(img_cpu_board,238,272,61,27);
          ctx.fillText(String(score[1]),242,284,50);
           if ((the_player==1)&&(block_click==0)&&(phase_jeu=="game")) {
            ctx.drawImage(img_arrow_right,213+dpos,283,18,15);
          }      
          //curseur du CPU
          if ((phase_cpu!="wait")&&(phase_jeu=="game")) {
            //si le CPU n'est pas en attente
            do_cpu();
          }
          ctx.drawImage(img_cpu_cursor,x_cpu_cursor,y_cpu_cursor,44,50);
          
          //c'est la fin du jeu
          if (phase_jeu=="end") {       
            if (score[0]>2000) {
                //win
                ctx.drawImage(img_board_win,22,30,256,192);
                if(postedscore==0){
                    post_score(score[0]);
                    postedscore=1;
                }
                
            }else if (score[1]>2000) {
                //lose
                ctx.drawImage(img_board_lose,22,30,256,192);
                if(postedscore==0){
                    post_score(0);
                    postedscore=1;
                }
            }
          }
          //render from hidden canvas to the visible one
          ctx2.drawImage(mycanvas,0,0,mycanvas2.width,mycanvas2.height);
          //le jeu continue
          window.requestAnimationFrame(game);
          
        }
        
        //resize the canvas
		function resize() {
			xx_canvas=0;
			yy_canvas=0;
			w_canvas=window.innerWidth;
			h_canvas=window.innerHeight;
			w_canvas1=h_canvas*canvas_ratio;
			h_canvas1=w_canvas/canvas_ratio;
			if (w_canvas<w_canvas1) {
				ww_canvas=w_canvas;
				hh_canvas=h_canvas1;
				yy_canvas=(h_canvas-h_canvas1)/2;
			}else{
				ww_canvas=w_canvas1;
				hh_canvas=h_canvas;
				xx_canvas=(w_canvas-w_canvas1)/2;
            }
			mycanvas2.style.position = "absolute";
			mycanvas2.style.left =xx_canvas.toString()+"px";
			mycanvas2.style.top =yy_canvas.toString()+"px";
			mycanvas2.width=ww_canvas;
			mycanvas2.height=hh_canvas;
        }
        
        window.onload = function () {	
           init();           
        }