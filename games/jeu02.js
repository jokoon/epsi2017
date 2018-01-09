        var mycanvas=null; //the hidden canvas cannot be defined yet
        var ctx = null; //the hidden context cannot be defined yet
        var mycanvas2=null; //the canvas displaying the game cannot be defined yet
        var ctx2 = null; //the context displaying the game cannot be defined yet
        var real_width=300; //real width of the canvas
        var real_height=300; //real height of the canvas
		var canvas_ratio=real_width/real_height; //ratio of the real canvas
		var dot_mouse={x:real_width/2,y:real_height/2}; //coordinates of the mouse in the real canvas
        
        //definition des media à charger
        var medias={
            files:['block0.png','block1.png','block2.png','block3.png','block4.png','fond.jpg','particle.png','cpu_board.png','player_board.png','cpu_cursor.png','arrow_left.png','arrow_right.png','win.png','lose.png','message_start.png'],
            folder:'block/',
            medias:[],
            loaded:0
        };
        var fond=new Image();
        var img_cpu_board=new Image();
        var img_player_board=new Image();
        var img_cpu_cursor=new Image();
        var img_arrow_left=new Image();
        var img_arrow_right=new Image();
        var img_loader=new Image();
        var img_board_win=new Image();
        var img_board_lose=new Image();
		var img_board_start=new Image();
        var phase_jeu="none";//aucune phase de jeu définie
        var nx=10;//nb de blocs horizontaux
        var ny=10;//nb de blocs verticaux
		var old_block_click=0;
        var block_click=0;
        var zone_width=300; // largeur de la zone
        var zone_height=300; //hauteur de la zone
        var id_current_explosion=-1; //explosion actuelle
        var id_current_flying_message=-1;//message volant actuel
        var id_current_block=-1;//block courant
        var color_max=2;//nombre max de couleurs
        var particles=[]; //conteneur des particles
        var blocks=[];//conteneur des blocks
        var used_blocks=[];//blocks réutilisables
        var flying_messages=[]; //conteneur des messages volants
        var score=[0,0];//score nul au départ player et CPU
        var tab_around=[{x:1,y:0},{x:0,y:1},{x:-1,y:0},{x:0,y:-1}];//autour d'un point
        //créer la grille vide
        var cell = new Array(nx); //conteneur de la grille
        var cell_insert = new Array(nx); //elements à insérer dans la grille
        for (var i = 0; i < nx; i++) {
           cell_insert[i]=0;
           cell[i] = new Array(ny);
           for (var j = 0; j < ny; j++) {
                cell[i][j]=-1;                
           }
        }
        //game CPU
        var the_player=1; //le cpu juste le temps que les blocks tombent et la main est récupérée par le joueur
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
        
        //classe des blocks
       function block(xx,yy,color){
          id_current_block++;          
          this.id=id_current_block;                    
          this.x=xx*30;
          this.y=yy*30;
          this.xx=xx;
          this.yy=yy;
          this.v=0;
          this.alive=1;          
          this.color=color;          
          this.image=new Image();
          this.image.src="block/block"+String(this.color)+".png";
          this.phase="tombe";
          this.move= function () {
            switch (this.phase) {
                case("tombe"):
                    //tombe
                    y1=Math.floor((this.y)/30);
                    this.v=0.9*this.v+1;                   
                    this.y+=this.v;
                    y2=Math.floor((this.y)/30);
                    
                    if ((y1>-1)&&(y2>-1)) {                      
                        if (y2>ny-1) {
                          y2=ny-1;
                        }
                        
                        ok=0;                        
                        stopped=0;
                        while (ok==0) {
                            if (cell[this.xx][y1+1]!=-1) {
                                ok=1;                             
                                stopped=1;
                            }
                            
                            if (y1==y2) {
                                ok=1;
                            }else{
                                if (stopped==0) {
                                    y1++;
                                }                                
                                if ((y1==ny-1)||(cell[this.xx][y1+1]!=-1)) {
                                    ok=1;                                    
                                    stopped=1;
                                }
                            }
                        }
                        if (stopped==1) {                            
                            this.v=0;                            
                            this.phase="wait";                            
                            if (cell[this.xx][y1]!=-1) {
                                console.log(" id_av:"+String(cell[this.xx][y1]));
                                
                                //remonte
                                okk=0;
                                
                                while (okk==0) {
                                    okk=1;
                                }
                                y1--;
                                
                            }
                            this.yy=y1;
                            this.y=this.yy*30;
                            cell[this.xx][this.yy]=this.id;                        
                        }
                      
                    }
                    break;
                case("wait"):                    
                    break;
                default:
                    break;
            }
                
                
          }
       }   
    
         
       
       //classe de particle
       function particle(x,y){
          id_current_explosion++;          
          this.id=id_current_explosion;                    
          this.x=x;
          this.y=y;
          this.vx=4*(my_random()-my_random());
          this.vy=4*(my_random()-my_random());
          this.image=new Image();
          this.image.src="block/particle.png";
          this.alive=1;         
          this.move= function () {               
                //monte
                this.vx=0.99*this.vx;
                this.x+=this.vx;
                this.vy=0.99*this.vy+1;              
                this.y+=this.vy;                    
                if (this.y>300) {                    
                    //meurt
                    this.alive=0;
                }       
          }
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
                this.x+=my_random()-my_random();
                this.v=this.v-my_random()*0.2;              
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
        //position de la souris
        function getMousePos(canvas, evt) {
             var rect = canvas.getBoundingClientRect();
             return {
               x: evt.clientX - rect.left,
               y: evt.clientY - rect.top
            };
        }
        //explosion de blocks
        function explose_block(xx,yy){
            if (block_click==0) {               
               ok=0;               
               nb_iter=0;
               my_color=blocks[cell[xx][yy]].color;
               selected_blocks=[cell[xx][yy]];
               //console.log("tab_sel:"+String(selected_blocks));
               //nb de blocs à réinsérer par colonne
               for (var i = 0; i < nx; i++) {
                  cell_insert[i]=0;
               }
               //propagation dans les cellules limitrophes de même couleur
               while (ok==0) {
                   blocks_to_explore=[];
                   for(i=0;i<selected_blocks.length;i++){
                       blocks_to_explore.push(selected_blocks[i]);
                   }
                   selected_blocks=[];
                   nb_iter++;
                   for(i=0;i<blocks_to_explore.length;i++){
                       id=blocks_to_explore[i];
                       dpts=nb_iter;
                       score[player_clicked]+=dpts;
                       flying_messages.push(new flying_message(blocks[id].x,blocks[id].y,"+"+String(dpts)));
                       for(k=0;k<10;k++){
                         particles.push(new particle(blocks[id].x+15,blocks[id].y+15));
                       }
                       cell[blocks[id].xx][blocks[id].yy]=-1;
                       blocks[id].phase="out";
                       blocks[id].y=-100;
                       used_blocks.push(id);
                       cell_insert[blocks[id].xx]++;                       
                       for(j=0;j<4;j++){                       
                           xx=blocks[id].xx+tab_around[j].x;
                           yy=blocks[id].yy+tab_around[j].y;
                           if ((xx>-1)&&(yy>-1)&&(xx<nx)&(yy<ny)) {
                               idd=cell[xx][yy];
                               if (idd>-1) {                                
                                   if (blocks[idd].color==my_color) {
                                       okk=1;                                
                                       for(k=0;k<selected_blocks.length;k++){
                                           if (selected_blocks[k]==idd) {
                                               okk=0;
                                           }
                                       }
                                       if (okk==1) {
                                           selected_blocks.push(idd);
                                       }
                                   }
                               }                      
                        
                           }
                       }
                   }
                   //console.log("tab_sel:"+String(selected_blocks));
                   if (selected_blocks.length==0) {
                       //fin de propagation
                       ok=1;                    
                   }
               }            
            
               //console.log("tab_used:"+String(used_blocks));
               //console.log("tab_ins:"+String(cell_insert));
               //reclasse les id dans used_blocks dans l'ordre croissant
               used_blocks.sort();
               //reinserion de blocs explosés
               nbb=-1;
               for (var i = 0; i < nx; i++) {
                   //fait chuter les blocs qui ne reposent sur rien
                   for (var j = ny-2; j >-1; j--) {
                       if ((cell[i][j]!=-1)&&(cell[i][j+1]==-1)) {
                           ide=cell[i][j];
                           blocks[ide].phase="tombe";
                           cell[i][j]=-1;
                       }
                 
                  
                   }                
                   //insère de nouveaux blocs en haut
                   for (var j = 0; j < cell_insert[i]; j++) {
                       color=Math.round(my_random()*color_max);
                       nbb++;
                       ide=used_blocks[nbb];
                       blocks[ide].phase="tombe";
                       blocks[ide].x=i*30;
                       blocks[ide].y=-(2*j+2)*30;
                       blocks[ide].xx=i;                    
                       blocks[ide].yy=-(2*j+2);                       
                       blocks[ide].v=0;
                       blocks[ide].alive=1;
                       blocks[ide].color=color;            
                       blocks[ide].image.src="block/block"+String(color)+".png";
                   }
               }    
               used_blocks=[];
            }
        }
        //en cas de clic
        function do_click(x,y){
			if (phase_jeu=="wait") {
                //not allowed
			}else if (phase_jeu=="start") {
                phase_jeu="game";
            }else if ((the_player==0)&&(block_click==0)) {
               //clic du joueur sur un bloc
               player_clicked=0;
               xx=Math.floor(x/30);
               yy=Math.floor(y/30);
               if (cell[xx][yy]!=-1) {
                   explose_block(xx,yy);
               }
            }
        }
        //charge le media suivant
        function load_next_media() {
            i=medias.medias.length;                       
            if (i==medias.files.length) {
                //tous les media sont chargés on passe à la suite                
                phase_jeu='start';
                fond.src="block/fond.jpg";
                img_player_board.src="block/player_board.png";
                img_cpu_board.src="block/cpu_board.png";
                img_cpu_cursor.src="block/cpu_cursor.png";
                img_arrow_left.src="block/arrow_left.png";
                img_arrow_right.src="block/arrow_right.png";
                img_board_win.src="block/win.png";
                img_board_lose.src="block/lose.png";
				img_board_start.src="block/message_start.png";
                for(i=0;i<nx;i++){
                     for(j=0;j<ny;j++){
                        color=Math.round(my_random()*color_max);
                        blocks.push(new block(i,-2-2*j,color));
                     }
                }
                
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
        //initialisation
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
          //listeners
            mycanvas2.addEventListener('mousemove', function(evt) {
                                     //if the mouse moves we keep its coordinates
                                     var mousePos = getMousePos(mycanvas2, evt);
                                     dot_mouse.x=mousePos.x*mycanvas.width/mycanvas2.width;
                                     dot_mouse.y=mousePos.y*mycanvas.height/mycanvas2.height;                                     
                                    }, false);
            mycanvas2.addEventListener('mousedown', function(evt) {
                                     //if the mouse moves we keep its coordinates
                                     var mousePos = getMousePos(mycanvas2, evt);
                                     do_click(mousePos.x*mycanvas.width/mycanvas2.width,mousePos.y*mycanvas.height/mycanvas2.height);                                     
                                    }, false);
          //phase du jeu
          phase_jeu='loader';
          
          //chargement du prochain media
          load_next_media();             
          
          
          //function appelée en boucle
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
				case('wait'):
					render_game();
					break;
                case('game'):
					//on change de joueur ?
					if ((old_block_click==1)&&(block_click==0)) {
						//changement de joueur
						the_player=1-the_player;
						if (the_player==1) {
							//initie le coup du CPU
							init_cpu_hit();
						}
						//verifie si ce n'est pas la fin du jeu
						if (score[0]>1000) {
                            //win
                            post_score(score[0]);
							phase_jeu="wait";
						}else if (score[1]>1000) {
                            post_score(0);
							phase_jeu="wait";
						}
            
					}
                    render_game();
                    break;
                default:
                    break;
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
		
		//rendu du menu de depart
		function render_start() {          
          var ctx = document.getElementById('id_canvas1').getContext('2d');          
          //efface le canvas
          ctx.clearRect(0,0,zone_width,zone_height);
		  //affiche le fond
          ctx.drawImage(fond,0,0,zone_width,zone_width);
		  //affiche le menu
		  ctx.drawImage(img_board_start,25,25);
		  //render from hidden canvas to the visible one
          ctx2.drawImage(mycanvas,0,0,mycanvas2.width,mycanvas2.height);
		  window.requestAnimationFrame(game);
		}

        
        //les actions du cpu
        function do_cpu() {            
            switch(phase_cpu){
                case('reach'):                    
                    xgoal_cpu=nx_cpu*30+15;
                    ygoal_cpu=ny_cpu*30+15;                    
                    break;
                case('go_home'):                    
                    xgoal_cpu=310;
                    ygoal_cpu=310;
                    break;
                default:
                    break;
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
                        explose_block(nx_cpu,ny_cpu);
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
                
            }
        }
        
        //retourne les points réalisés si on clique sur la cellule xx,yy
        function calcule_points(xx,yy){
               my_points=0;
               ok=0;               
               nb_iter=0;
               //copie de la grille               
               cell_copy = new Array(nx);               
               for (var i = 0; i < nx; i++) {                    
                    cell_copy[i] = new Array(ny);
                    for (var j = 0; j < ny; j++) {
                          cell_copy[i][j]=cell[i][j];                
                    }
               }
               //couleur de la cellule
               my_color=blocks[cell_copy[xx][yy]].color;
               selected_blocks=[cell_copy[xx][yy]];                              
               //propagation dans les cellules limitrophes de même couleur
               while (ok==0) {
                   blocks_to_explore=[];
                   for(i=0;i<selected_blocks.length;i++){
                       blocks_to_explore.push(selected_blocks[i]);
                   }
                   selected_blocks=[];
                   nb_iter++;
                   for(i=0;i<blocks_to_explore.length;i++){
                       id=blocks_to_explore[i];
                       dpts=nb_iter;
                       my_points+=dpts;                                              
                       cell_copy[blocks[id].xx][blocks[id].yy]=-1;                                            
                       for(j=0;j<4;j++){                       
                           xx=blocks[id].xx+tab_around[j].x;
                           yy=blocks[id].yy+tab_around[j].y;
                           if ((xx>-1)&&(yy>-1)&&(xx<nx)&(yy<ny)) {
                               idd=cell_copy[xx][yy];
                               if (idd>-1) {                                
                                   if (blocks[idd].color==my_color) {
                                       okk=1;                                
                                       for(k=0;k<selected_blocks.length;k++){
                                           if (selected_blocks[k]==idd) {
                                               okk=0;
                                           }
                                       }
                                       if (okk==1) {
                                           selected_blocks.push(idd);
                                       }
                                   }
                               }                      
                        
                           }
                       }
                   }
                   //console.log("tab_sel:"+String(selected_blocks));
                   if (selected_blocks.length==0) {
                       //fin de propagation
                       ok=1;                    
                   }
               }
               return my_points;
        }
        
        //IA du CPU
        function CPU_choice() {
            console.log("---------------");
            pts_max=0;
            possible_cells=[];
            for (var i = 0; i < nx; i++) {                                        
                    for (var j = 0; j < ny; j++) {
                        pts=calcule_points(i,j);
                        if (pts>pts_max){
                            //un nouveau score max a été trouvé
                            pts_max=pts;
                            console.log("nouveau points max : "+String(pts)+" ["+String(i)+","+String(j)+"]");
                            //les choix possibles sont réinitialisés
                            possible_cells=[[i,j]];
                        }else if (pts==pts_max) {
                            //un nouveau candidat qui fait marquer autant de points
                            possible_cells.push([i,j]);
                            console.log("autre cellule possible : ["+String(i)+","+String(j)+"]");
                        }
                    }
            }
			//trois fois sur quatre
            //parmis les cellules rapportant le plus de points en choisit une au hasard
			//sinon choisit une cellule au hasard
			if (my_random()<0.75) {
                nrand=Math.floor(my_random()*possible_cells.length);
                console.log("cellule choisie pour "+String(pts_max)+" point(s) : ["+String(possible_cells[nrand][0])+","+String(possible_cells[nrand][1])+"]");
				my_cell=possible_cells[nrand];
            }else{
				my_cell=[Math.floor(my_random()*nx),Math.floor(my_random()*ny)];
				console.log("cellule choisie au hasard");
			}            
            return my_cell;
        }
        
        //initie le coup du cpu
        function init_cpu_hit() {
            playing_cpu=1;            
            x_cpu_cursor=310;
            y_cpu_cursor=310;
            vx_cpu_cursor=-my_random()*30;
            vy_cpu_cursor=-my_random()*30;
            //choix aléatoire d'une cellule à cliquer
            phase_cpu="reach";
            cell_choosen=CPU_choice();
            nx_cpu=cell_choosen[0];
            ny_cpu=cell_choosen[1];            
        }
        
        //rendu du jeu
        function render_game() {
          var ctx = document.getElementById('id_canvas1').getContext('2d');                  
          //efface le canvas
          ctx.clearRect(0,0,zone_width,zone_height);
          //affiche le fond
          ctx.drawImage(fond,0,0,zone_width,zone_width);
          // Blocks
          old_block_click=block_click;
          block_click=0;
          for(i=0;i<blocks.length;i++){
             if (blocks[i].alive==1) {       
               ctx.save();            
               blocks[i].move();
               if (blocks[i].phase!="wait") {
                 block_click=1;
               }
               ctx.translate(blocks[i].x,blocks[i].y);
               ctx.drawImage(blocks[i].image,0,0);
               ctx.restore();
            }
          }
          
          //particles          
          var nn=particles.length;
          var i=0;
          while (i<nn) {                      
            particles[i].move();
            ctx.save();
            ctx.translate(particles[i].x,particles[i].y);
            ctx.drawImage(particles[i].image,-6,-6);
            ctx.restore();
            if (particles[i].alive==0) {
                //detruit l'objet et reste sur place dans le tableau
                particles[i]=null;
                particles.splice(i,1);                
                nn--;
            }else{
                //passe au suivant
                i++;
            }
          }          
          //messages volant
          ctx.font = "bold 15px Arial";
          ctx.fillStyle = 'red';
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
          ctx.globalAlpha=1;
          ctx.font = "14px Arial";
          ctx.fillStyle = 'yellow';
          currenttime = new Date();
          t = currenttime.getTime()/100;
          dpos=20*Math.cos(t);
          //score player
          ctx.drawImage(img_player_board,1,272,61,27);          
          ctx.fillText(String(score[0]),5,284,50);
          if ((the_player==0)&&(block_click==0)&&(phase_jeu!="wait")) {
            ctx.drawImage(img_arrow_left,62+10+dpos,283,18,15);
          }
          //score computer
          ctx.drawImage(img_cpu_board,238,272,61,27);
          ctx.fillText(String(score[1]),242,284,50);
           if ((the_player==1)&&(block_click==0)&&(phase_jeu!="wait")) {
            ctx.drawImage(img_arrow_right,213+dpos,283,18,15);
          }      
          //curseur du CPU
          if ((phase_cpu!="wait")&&(phase_jeu!="wait")) {
            //si le CPU n'est pas en attente
            do_cpu();
          }
          ctx.drawImage(img_cpu_cursor,x_cpu_cursor,y_cpu_cursor,44,50);
          
          //c'est la fin du jeu
          if (phase_jeu=="wait") {       
            if (score[0]>1000) {
                //win
                ctx.drawImage(img_board_win,22,30,256,192);
            }else if (score[1]>1000) {
                ctx.drawImage(img_board_lose,22,30,256,192);
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
        
        //lorsque le corps de la page est chargé alors on initialise le programme
        window.onload = function () {	
           init();           
        }