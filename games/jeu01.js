          //variables        
          //origine of the rendering
          var xorigine=150; 
          var yorigine=150;
          //game
          var player=1;
		  var score=0;
		  var bonus_score=0;
          var current_character=[-1,-1];
          var now_char=0;
          //camera
          var dot_mouse={x:150,y:150};
          var xcam=0;
          var ycam=0;
          var vxcam=0;
          var vycam=0;
          var waitlasttime=null;
          var waitduration=2000;
          var game_phase="wait_click";
		  var start_click=0;
          var next_game_phase="init_next_player";
          var cam_ready=0;
          var cam_mode="stop";
          var cam_zoom_goal;
          var cam_char_goal;
          var allow_movement_mouse=1;
          var mouse_mode="none";
          var zoom=0.1;
          var vzoom=0;
          var lxcam=0;
          var lycam=0;
          var lxcammax=0;
          var lxcammin=0;
          var lycammax=0;
          var lycammin=0;
          var xisland=0;
          var lxisland=0;
          var yisland=0;
          var lyisland=0;
          var skywidth=600;
          var xsky=0;
          var twater=0;
          var deg=Math.PI/180; //convert in degres
          //rendering
          var d_render=3;
          var mycanvas=null; //the hidden canvas cannot be defined yet
          var ctx = null; //the hidden context cannot be defined yet
          var mycanvas2=null; //the canvas displaying the game cannot be defined yet
          var ctx2 = null; //the context displaying the game cannot be defined yet
          var real_width=400; //real width of the canvas
          var real_height=300; //real height of the canvas
		  var canvas_ratio=real_width/real_height;
          //canvas to render the island and modify it without having to generate it all the time
          var imgData=0;
          var imgDataDest=0;
          var worldcanvas = document.createElement('canvas');
          var worldx=160*20;
          var worldy=160*10;
          worldcanvas.width = worldx;
          worldcanvas.height = worldy;
          var worldctx = worldcanvas.getContext('2d');
          //loading
          var spriteimgData=0;
          var spritecanvas = document.createElement('canvas');
          var spritewidth=804;
          var spriteheight=400;
          spritecanvas.width = spritewidth;
          spritecanvas.height = spriteheight;
          var spritectx = spritecanvas.getContext('2d');
          var img_loader=[];
          var images=[{loaded:0,src:"island/texture_rock.jpg",width:160,height:160},{loaded:0,src:"island/mountains.png",width:804,height:400},{loaded:0,src:"island/sky.jpg",width:600,height:150},{loaded:0,src:"island/water.png",width:512,height:20},{loaded:0,src:"island/texture_sand.jpg",width:160,height:160},{loaded:0,src:"island/grass.jpg",width:160,height:28},{loaded:0,src:"island/plant_01.png",width:75,height:127},{loaded:0,src:"island/plant_02.png",width:100,height:90},{loaded:0,src:"island/plant_03.png",width:100,height:100},{loaded:0,src:"island/plant_04.png",width:50,height:57},{loaded:0,src:"island/boom.png",width:320,height:320},{loaded:0,src:"island/soldier_blue_front_01.png",width:32,height:32},{loaded:0,src:"island/soldier_blue_front_02.png",width:32,height:32},{loaded:0,src:"island/soldier_blue_front_03.png",width:32,height:32},{loaded:0,src:"island/soldier_blue_right_01.png",width:32,height:32},{loaded:0,src:"island/soldier_blue_right_02.png",width:32,height:32},{loaded:0,src:"island/soldier_blue_right_03.png",width:32,height:32},{loaded:0,src:"island/soldier_blue_left_01.png",width:32,height:32},{loaded:0,src:"island/soldier_blue_left_02.png",width:32,height:32},{loaded:0,src:"island/soldier_blue_left_03.png",width:32,height:32},{loaded:0,src:"island/soldier_red_front_01.png",width:32,height:32},{loaded:0,src:"island/soldier_red_front_02.png",width:32,height:32},{loaded:0,src:"island/soldier_red_front_03.png",width:32,height:32},{loaded:0,src:"island/soldier_red_right_01.png",width:32,height:32},{loaded:0,src:"island/soldier_red_right_02.png",width:32,height:32},{loaded:0,src:"island/soldier_red_right_03.png",width:32,height:32},{loaded:0,src:"island/soldier_red_left_01.png",width:32,height:32},{loaded:0,src:"island/soldier_red_left_02.png",width:32,height:32},{loaded:0,src:"island/soldier_red_left_03.png",width:32,height:32},{loaded:0,src:"island/rock01.png",width:30,height:28},{loaded:0,src:"island/rock02.png",width:22,height:26},{loaded:0,src:"island/rock03.png",width:41,height:32},{loaded:0,src:"island/rock04.png",width:44,height:63},{loaded:0,src:"island/rock05.png",width:70,height:76},{loaded:0,src:"island/splash.png",width:192,height:192},{loaded:0,src:"island/arrow.png",width:32,height:32},{loaded:0,src:"island/interface2.jpg",width:100,height:300},{loaded:0,src:"island/button_previous.png",width:20,height:20},{loaded:0,src:"island/button_next.png",width:20,height:20},{loaded:0,src:"island/icone_walk.png",width:64,height:64},{loaded:0,src:"island/icone_dynamite.png",width:64,height:64},{loaded:0,src:"island/icone_missile.png",width:64,height:64},{loaded:0,src:"island/icone_clusterbomb.png",width:64,height:64},{loaded:0,src:"island/icone_airstrike.png",width:64,height:64},{loaded:0,src:"island/cursor_footprint.png",width:32,height:32},{loaded:0,src:"island/cursor_target.png",width:32,height:32},{loaded:0,src:"island/selector.png",width:48,height:50},{loaded:0,src:"island/weapon_dynamite.png",width:30,height:50},{loaded:0,src:"island/bomb.png",width:80,height:30},{loaded:0,src:"island/smoke.png",width:256,height:64},{loaded:0,src:"island/plane.png",width:310,height:100},{loaded:0,src:"island/soldier_blue_launcher_bottom.png",width:32,height:32},{loaded:0,src:"island/soldier_blue_launcher_right.png",width:32,height:32},{loaded:0,src:"island/soldier_blue_launcher_left.png",width:32,height:32},{loaded:0,src:"island/soldier_red_launcher_bottom.png",width:32,height:32},{loaded:0,src:"island/soldier_red_launcher_right.png",width:32,height:32},{loaded:0,src:"island/soldier_red_launcher_left.png",width:32,height:32},{loaded:0,src:"island/rocket.png",width:92,height:32},{loaded:0,src:"island/rocket_fire.png",width:32,height:160},{loaded:0,src:"island/cluster.png",width:64,height:32},{loaded:0,src:"island/fireball.png",width:57,height:39}];
          var id_explosion_sprite=10;
          var id_perso_sprite=11;
          var nb_perso_sprite=9;
          var id_tree_sprite=6;
          var id_rock_sprite=29;
          var id_splash_sprite=34;
          var id_sprite_arrow=35;
          var id_sprite_interface=36;
          var id_sprite_buttons=37;
          var id_sprite_icons=39;
          var id_sprite_cursors=44;
          var id_sprite_selector=46;
          var id_sprite_dynamite=47;
          var id_sprite_bomb=48;
          var id_sprite_smoke=49;
          var id_sprite_plane=50;
          var id_perso_launcher_sprite=51;
          var id_sprite_rocket=57;
          var id_sprite_cluster=59;
          var id_sprite_fireball=60;
          var imgDataGrass=0;
          var loaded_images=0;
          var nbimageready=0;
          var nbimagereadymax=0;
          var show_timer=0;
          var show_selector=0;
          var keep_inside_character=0;
          var tlasttimer=null;
          var str_timer;
          var show_buttons=0;
          var show_icons=0;
          var show_cursors=0;
          var id_icon=0;
          var id_cursor=0;
          var x_airstrike=160*10;
          //characters
          var nb_characters=2*20;
          var nb_char_alive=[nb_characters/2,nb_characters/2];
          var characters=[];
          var nb_trees=80;
          var trees=[];
          var explosions=[];
          var nb_explosions=0;
          var particles=[];
          var nb_particles=0;
          var vx_rocket_init=0;
          var vy_rocket_init=0;
          //objects reacting to follow by the camera
          var characters_reacting=[];
          var particles_reacting=[];
          //messages
          var show_message=0;
          var img_message=new Image();
          //CPU
          var tlastdecision=0;
		  //sounds
		  var snd_loop=null;
		  
		  
		  //my random function
		  function my_random() {
			var xrand = Math.sin(random_seed++) * 10000;
			return xrand - Math.floor(xrand);
		  }
         //poste le score
        function post_score(my_score){
            URL_POST=URL_POST_SCORE+"&score="+my_score;
            alert("POST:"+URL_POST);
            var oReq = new XMLHttpRequest();
            oReq.addEventListener("load", callbackscore);
            oReq.open("GET", URL_POST);
            oReq.send();
        }
        //callback score
        function callbackscore(){
            alert("callback:"+this.responseText);
            setTimeout(leave_page,3000)
        }
        //change de page
        function leave_page(){
            alert("quitte la page au bout de 3s");
            location.replace(URL_END);
        }
         //class of the characters
         function  character(id,x,y,team) {
             this.id=id;
             this.x=x;
             this.y=y;
             this.step=0;
             this.orient=0;
             currenttime= new Date();
             this.lasttime=currenttime.getTime()+(my_random()-my_random())*1000;
             this.team=team;
             this.ang=0;
             this.vang=0;
             this.vx=0;
             this.vy=0;
             this.alive=1;
             this.action="wait";
             //main method
             this.main= function () {
                switch (this.action) {
                    case "wait":
                        this.wait();
                        break;
                    case "fall":
                        this.fall();
                        break;
                    default:
                        break;
                }
             }
             //character waiting
             this.wait= function () {
                i=4*(Math.floor(this.x)+Math.floor(this.y)*160*20);
                if ((i>-1)&&(i<4*(160*20*160*10))) {
                      if (imgDataDest.data[i+3]==0) {
                          this.vx=0;
                          this.vy=0;
                          this.vang=0;
                          this.action="fall";
                      }
                }
             }
             //character falling
             this.fall= function () {
                this.vx=0.95*this.vx;
                this.vy=0.98*this.vy+1;
                v=Math.sqrt(this.vx*this.vx+this.vy*this.vy);
                vvx=this.vx/v;
                vvy=this.vy/v;
                this.vang=0.98*this.vang;
                this.ang+=this.vang;
                ok=0;
                vv=-1;
                while (ok==0) {
                    vv++;
                    xx=Math.floor(this.x+vv*vvx);
                    yy=Math.floor(this.y+vv*vvy);
                    if ((xx>-1)&&(yy>-1)&&(xx<160*20)&&(yy<160*10)) {
                        i=4*(xx+yy*160*20);
                        if (imgDataDest.data[i+3]!=0) {
                            ok=1;
                            this.x=xx;
                            this.y=yy;
                            this.action="wait";
                            this.ang=0;
                            this.vx=0;
                            this.vy=0;
                        }
                    }
                    if (vv>=v) {
                        ok=1;
                    }
                }
                if (this.action=="fall") {
                    this.x+=this.vx;
                    this.y+=this.vy;
                    if (this.y>160*10) {
                        this.alive=0;
						if ((player==0)&&(this.team==1)) {
							//PLAYER SCORES POINTS
							bonus_score+=0.2;
                            score+=Math.floor(100+Math.pow(10,1+bonus_score));
                        }
                        nb_char_alive[this.team]--;
                        this.action="dead";
                        create_splash(this.x-this.vx,4);
                        if (now_char==this.id) {
                            currenttime= new Date();
                            tlasttimer-=2*duration_timer;
                        }
                    }
                }
             }
         }
         
         //class of the trees
         function  tree(id,x,y,type) {
             this.id=id;
             this.x=x;
             this.y=y;
             this.type=type;
             this.alive=1;
         }
        
         //class of the explosions
         function  explosion(id,x,y,ray) {
             this.id=id;
             this.x=x;
             this.y=y;
             this.ray=ray;
             this.step=0;
             currenttime= new Date();
             this.lasttime=currenttime.getTime();
             this.action="blast";
             //main method
             this.main= function () {
                switch (this.action) {
                    case "blast":
                        this.blast();
                        break;
                    default:
                        break;
                }
             }
             //exploding
             this.blast= function () {
                 currenttime= new Date();
                 t=currenttime.getTime()-this.lasttime;
                 if (t>30) {
                    this.lasttime=currenttime.getTime();
                    this.step++;
                    if (this.step==23) {
                        //end of the graphic blast
                        this.action="end";
                    }
                 }
             }

         }
         
         //class of the particles
         function particle(id,action,img,x,y,w,h,sx,sy,sw,sh,vx,vy,vang,properties) {
             this.id=id;
             this.x=x;
             this.y=y;
             this.img=img;
             this.width=w;
             this.height=h;
             this.sx=sx;
             this.sy=sy;
             this.sw=sw;
             this.sh=sh;
             currenttime= new Date();
             this.lasttime=currenttime.getTime()+(my_random()-my_random())*1000;
             this.ang=0;
             this.vang=vang;
             this.vx=vx;
             this.vy=vy;
             this.alive=1;
             this.action=action;
             this.step=0;
             this.properties=properties;
             currenttime= new Date();
             this.lasttime=currenttime.getTime();
             //main method
             this.main= function () {
                switch (this.action) {
                    case "fall":
                        this.fall();
                        break;
                    case "animation":
                        this.animation();
                        break;
                    case "airstrike":
                        this.airstrike();
                        break;
                    case "bomb":
                        this.bomb();
                        break;
                    case "rocket":
                        this.rocket();
                    default:
                        break;
                }
             }
             //particle falling
             this.fall= function () {
                this.vx=0.95*this.vx;
                this.vy=0.98*this.vy+1;
                this.vang=0.98*this.vang;
                this.x+=this.vx;
                this.y+=this.vy;
                this.ang+=this.vang;
                if (this.y>160*10) {
                    this.alive=0;
                    if (this.properties.create_splash==1) {
                       create_splash(this.x,2);
                    }
                    this.action="dead";
                }
             }
             //particle animation
             this.animation= function () {
                currenttime= new Date();
                 t=currenttime.getTime()-this.lasttime;
                 if (t>this.properties.dt) {
                    this.lasttime=currenttime.getTime();
                    this.step++;
                    if (this.step==this.properties.step_max) {
                        if (this.properties.loop==1) {
                            this.step=0;
                        }else{
                            this.alive=0;
                            this.action="dead";
                        }
                    }
                 }
             }
             //plane in airstrike
             this.airstrike= function () {
                this.vx=0.95*this.vx+0.5;
                this.vy=0.95*this.vy+(my_random()-my_random())/2;
                this.x+=this.vx;
                this.y+=this.vy;
                if (this.y>160) {
                    this.y=160;
                    this.vy=-Math.abs(this.vy);
                }
                if (this.y<0) {
                    this.y=0;
                    this.vy=Math.abs(this.vy);
                }
                if (this.x>160*20) {
                    this.alive=0;
                    this.action="dead";
                }
                currenttime= new Date();
                if(currenttime.getTime()-this.properties.t_smoke>this.properties.dt_smoke){
                    this.properties.t_smoke=currenttime.getTime();
                    create_smoke(this.x-135,this.y,3);
                }
                if ((this.x>x_airstrike-160*3)&&(this.x<x_airstrike+160)) {
                    if(currenttime.getTime()-this.properties.t_bomb>this.properties.dt_bomb){
                        this.properties.t_bomb=currenttime.getTime();
						createjs.Sound.play("fall");
                        create_bomb("bomb",this.x,this.y,this.vx,this.vy);
                    }
                }
             }
             //bomb falling
             this.bomb= function () {
                this.vx=this.properties.kx*this.vx;
                this.vy=this.properties.ky*this.vy+this.properties.gravity;
                v=Math.sqrt(this.vx*this.vx+this.vy*this.vy);
                vvx=this.vx/v;
                vvy=this.vy/v;
                ok=0;
                vv=-1;
                while (ok==0) {
                    vv++;
                    xx=Math.floor(this.x+vv*vvx);
                    yy=Math.floor(this.y+vv*vvy);
                    if ((xx>-1)&&(yy>-1)&&(xx<160*20)&&(yy<160*10)) {
                        i=4*(xx+yy*160*20);
                        if (imgDataDest.data[i+3]!=0) {
                            ok=1;
                            this.x=xx;
                            this.y=yy;
                            this.alive=0;
                            this.action="dead";
                            this.ang=0;
                            this.vx=0;
                            this.vy=0;
                            x=xx*zoom+xisland;
                            y=yy*zoom+yisland;
                            do_explosion(x,y,200);
                        }
                    }
                    if (vv>=v) {
                        ok=1;
                    }
                }
                if (this.action=="bomb") {
                    this.x+=this.vx;
                    this.y+=this.vy;
                    this.ang=Math.atan2(this.vy,this.vx)/deg;
                    if (this.y>160*10) {
                        this.alive=0;
                        this.action="dead";
                        if (this.properties.create_splash==1) {
                            create_splash(this.x,2);
                        }
                    }
                }
             }
             //rocket
             this.rocket=function (){
                if (this.properties.no_target!=1) {
                    ax=this.properties.xtarget-this.x;
                    ay=this.properties.ytarget-this.y;
                    rr=Math.sqrt(ax*ax+ay*ay);
                    ax=1.5*ax/rr;
                    ay=1.5*ay/rr
                }else{
                    ax=0;
                    ay=0;
                }
                this.vx=this.properties.kx*this.vx+ax;
                this.vy=this.properties.ky*this.vy+ay+this.properties.gravity;
                v=Math.sqrt(this.vx*this.vx+this.vy*this.vy);
                vvx=this.vx/v;
                vvy=this.vy/v;
                ok=0;
                if (this.properties.no_target!=1) {
                    if (rr<10) {
                        ok=1;
                        this.x=xx;
                        this.y=yy;
                        this.alive=0;
                        this.action="dead";
                        this.ang=0;
                        this.vx=0;
                        this.vy=0;
                        x=xx*zoom+xisland;
                        y=yy*zoom+yisland;
                        do_explosion(x,y,400);
                    }
                }
                vv=-1;
                while (ok==0) {
                    vv++;
                    xx=Math.floor(this.x+vv*vvx);
                    yy=Math.floor(this.y+vv*vvy);
                    if ((xx>-1)&&(yy>-1)&&(xx<160*20)&&(yy<160*10)) {
                        i=4*(xx+yy*160*20);
                        if (imgDataDest.data[i+3]!=0) {
                            ok=1;
                            this.x=xx;
                            this.y=yy;
                            if (this.properties.cluster==1) {
                                //cluster explosion
                                for(aa=0;aa<12;aa++){
                                    an=(this.ang+90+my_random()*180)*deg;
                                    rn=10+my_random()*20;
                                    vxc=rn*Math.cos(an);
                                    vyc=rn*Math.sin(an);
                                    create_bomb("fireball",this.x,this.y,vxc,vyc);
                                }
                            }
                            this.alive=0;
                            this.action="dead";
                            this.ang=0;
                            this.vx=0;
                            this.vy=0;
                            x=xx*zoom+xisland;
                            y=yy*zoom+yisland;
                            do_explosion(x,y,400);
                        }
                    }
                    if (vv>=v) {
                        ok=1;
                    }
                }
                if (this.action=="rocket") {
                    this.x+=this.vx;
                    this.y+=this.vy;
                    this.ang=Math.atan2(this.vy,this.vx)/deg;
                    an=this.ang*deg;
                    xu=Math.cos(an);
                    yu=Math.sin(an);
                    if (this.img==id_sprite_rocket) {
                       dicon=46+16;
                    }else{
                       dicon=32;
                    }
                    this.properties.fire_x=this.x-dicon*xu;
                    this.properties.fire_y=this.y-dicon*yu;
                    currenttime= new Date();
                    if(currenttime.getTime()-this.properties.t_smoke>this.properties.dt_smoke){
                        this.properties.t_smoke=currenttime.getTime();
                        create_smoke(this.x-46*xu,this.y-46*yu,3);
                    }
                    if(currenttime.getTime()-this.properties.t_flame>this.properties.dt_flame){
                        this.properties.t_flame=currenttime.getTime();
                        this.properties.fire_step++;
                        if (this.properties.fire_step>=this.properties.fire_step_max) {
                            this.properties.fire_step=0;
                        }
                    }
                    if (this.y>160*10) {
                        this.alive=0;
                        this.action="dead";
                        if (this.properties.create_splash==1) {
                            create_splash(this.x,2);
                        }
                    }
                }
             }
         }
         
        //create a splash
        function create_splash(x,size) {
			
            nb_particles++;
            img=id_splash_sprite;
            vx=0;
            vy=0;
            vang=0;
            w=64*size;
            h=64*size;
            sx=0;
            sy=0;
            sw=0;
            sh=0;
            y=160*10-h/2+4*size;
            if (size==4) {
				createjs.Sound.play("splash");
                mytype="character_splash";
                myreaction=1;
            }else{
                mytype="other_splash";
                myreaction=0;
            }
            properties={dt:300,loop:0,step_max:4,nb_sprite_w:3,sw:64,sh:64,type:mytype,in_reaction:myreaction};
            particles.push(new particle(nb_particles,"animation",img,x,y,w,h,sx,sy,sw,sh,vx,vy,vang,properties));
        }
        
        //create smoke
        function create_smoke(x,y,size) {
            nb_particles++;
            img=id_sprite_smoke;
            vx=0;
            vy=0;
            vang=0;
            w=32*size;
            h=32*size;
            sx=0;
            sy=0;
            sw=0;
            sh=0;
            myreaction=0;
            properties={dt:25,loop:0,step_max:16,nb_sprite_w:8,sw:32,sh:32,in_reaction:myreaction};
            particles.push(new particle(nb_particles,"animation",img,x,y,w,h,sx,sy,sw,sh,vx,vy,vang,properties));
        }
        
        //create bomb
        function create_bomb(kind,x,y,vx,vy) {
            nb_particles++;
            if (kind=="bomb") {
                img=id_sprite_bomb;
                vang=0;
                w=80;
                h=30;
                sx=0;
                sy=0;
                sw=80;
                sh=30;
                properties={in_reaction:1,create_splash:1,kx:0.95,ky:0.98,gravity:1};
            }else if(kind=="fireball"){
                img=id_sprite_fireball;
                vang=0;
                w=57*2;
                h=39*2;
                sx=0;
                sy=0;
                sw=57;
                sh=39;
                properties={in_reaction:1,create_splash:1,kx:0.99,ky:0.99,gravity:0.5};
            }
            particles.push(new particle(nb_particles,"bomb",img,x,y,w,h,sx,sy,sw,sh,vx,vy,vang,properties));
        }
          
        //load the next media 
        function load_next_media() {
            if (loaded_images==images.length) {
                //all media have been loaded so what next ?
                //render the sprites
                renderinspritecanvas();
            }else{
                img_loader.push(new Image());
                i=img_loader.length-1;
                img_loader[i].src=images[loaded_images].src;
                
                img_loader[i].onload=loaded_media();
            }
        }
        //each time a media is loaded
        function loaded_media(){
            loaded_images++;
            load_next_media();
        }
        
        //render the loader bar
        function render_loader() {
          //erase the context
          ctx.clearRect(0,0,300,300);
          if (nbimageready>nbimagereadymax) {
            nbimagereadymax=nbimageready;
          }
          percent=nbimagereadymax/images.length;
          //empty bar
          ctx.beginPath();
          ctx.strokeStyle="red";
          ctx.fillStyle="black";
          ctx.fillRect(50,125,200,50);
          ctx.fill();
          ctx.stroke();
          //progession
          ctx.beginPath();
          ctx.strokeStyle="red";
          ctx.fillStyle="orange";
          ctx.fillRect(50,125,200*percent,50);
          ctx.fill();
          ctx.stroke();
          //render from hidden canvas to the visible one
          ctx2.drawImage(mycanvas,0,0,mycanvas2.width,mycanvas2.height);
        }
          
        //render the sprites image in the spritecanvas
        function renderinspritecanvas() {
            ok=1;
            nbimageready=0;
            for (a=0;a<img_loader.length;a++) {
                    if(img_loader[a].width!=images[a].width){
                       ok=0;
                    }
            }
            if (ok==1) {
                //display the image of the sprites in the sprite canvas
                okk=1;
                for (a=0;a<img_loader.length;a++) {
                   if (images[a].loaded==1) {
                        nbimageready++;
                   }else{
                        spritectx.clearRect(0,0,spritewidth,spriteheight);
                        spritectx.drawImage(img_loader[a],0,0);
                        imgData=spritectx.getImageData(0,0,images[a].width,images[a].height);
                        x=Math.floor(my_random()*images[a].width);
                        y=Math.floor(my_random()*images[a].height);
                        if (imgData.data[4*(x+y*images[a].width)+3]==0) {                        
                             okk=0;
                        }else{
                           //keep the grass data
                           if (a==5) {
                             imgDataGrass=spritectx.getImageData(0,0,160,111);
                           }
                           //anyway for any other image
                           images[a].loaded=1;
                           nbimageready++;
                        }
                   }
                }
                render_loader();
                if (okk==0) {
                    window.requestAnimationFrame(renderinspritecanvas);   
                }else{
                   render_loader();
				   init_start_message();
                   window.requestAnimationFrame(render_island);
                }
            }else{
                window.requestAnimationFrame(renderinspritecanvas);   
            }
        }
          
        //rendering the island
        function render_island() {
            worldctx.clearRect(0,0,160*20,160*10);
            for(y=0;y<10;y++){
               yy=y*160;
               img_id=0;
               if (y==9) {
                 img_id=4;
               }
               for(x=0;x<20;x++){
                  xx=x*160;
                  worldctx.drawImage(img_loader[img_id],xx,yy);
               }
            }
            imgDataDest=worldctx.getImageData(0,0,160*20,160*10);
            worldctx.clearRect(0,0,160*20,160*10);
            h=[];
            dm=160*20;
            hh=160*5;
            vh=0;
            for(a=0;a<dm;a++){
                vh=0.9*vh+(my_random()-my_random())*3;
                hh=hh+vh;
                if (hh>160*8) {
                    hh=160*8;
                    vh=-Math.abs(vh);
                }
                if (hh<0) {
                    hh=0;
                    vh=Math.abs(vh);
                }
                h.push(hh);
            }
            for(a=0;a<160;a++){
                h[a]=a;
                h[160*20-a-1]=h[a];
            }
            nb_smooth=100;
            for(a=0;a<nb_smooth;a++){
                h[0]=0;
                for(b=1;b<dm/2+1;b++){
                    h[b]=(h[b-1]+h[b])/2;
                }
                h[dm-1]=0;
                for(b=dm-2;b>dm/2-1;b--){
                    h[b]=(h[b+1]+h[b])/2;
                }
            }
            //create the trees
            y=160*9;
            for(a=0;a<nb_trees;a++){              
               if (a<3*nb_trees/4) {
                  ok=0;
                  while (ok==0) {
                    x=320+Math.floor(my_random()*(160*20-640));
                    if (y+2>160*10-h[x]) {
                        ok=1;
                    }
                  }
                  y+=2;
               }else{
                  x=320+Math.floor(my_random()*(160*20-640));
                  y=160*10-h[x];
                  hh=h[x];
                  for(b=-40;b<40;b++){
                    h[x+b]=hh;
                  }
               }
               type=Math.floor(my_random()*4);
               trees.push(new tree(a,x,y,type));
            }
            //resmooth
            h[0]=0;
            for(b=1;b<dm/2+1;b++){
                h[b]=(h[b-1]+h[b])/2;
            }
            h[dm-1]=0;
            for(b=dm-2;b>dm/2-1;b--){
                h[b]=(h[b+1]+h[b])/2;
            }
            //create the mountains
            for(x=0;x<160*20;x++){
                for(y=0;y<160*10-h[x];y++){
                    i=4*(x+y*160*20);
                    imgDataDest.data[i]=0;
                    imgDataDest.data[i+1]=0;
                    imgDataDest.data[i+2]=0;
                    imgDataDest.data[i+3]=0;
                }
            }
            //insert grass
            for(x=160;x<160*19;x++){
                for(yg=0;yg<111;yg++){
                    y=Math.floor(160*10-h[x])+yg;
                    if (y<160*9) {
                       xg=(x)%160;
                       ig=4*(xg+yg*160);
                       r=imgDataGrass.data[ig];
                       g=imgDataGrass.data[ig+1];
                       b=imgDataGrass.data[ig+2];
                       i=4*(x+y*160*20);
                       imgDataDest.data[i]=r;
                       imgDataDest.data[i+1]=g;
                       imgDataDest.data[i+2]=b;
                       imgDataDest.data[i+3]=255;
                    }
                }
            }
            //render the island
            worldctx.putImageData(imgDataDest,0,0);
            //create the characters
            team=0;
            for(a=0;a<nb_characters;a++){              
               if (a>nb_characters/2-1) {
                  team=1;
               }
               x=320+Math.floor(my_random()*(160*20-640));
               y=160*10-h[x];
               characters.push(new character(a,x,y,team));
            }
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
            //main and loop function
            window.requestAnimationFrame(main);
        }
        
        //get the mouse coordinates
        function getMousePos(canvas, evt) {
             var rect = canvas.getBoundingClientRect();
             return {
               x: evt.clientX - rect.left,
               y: evt.clientY - rect.top
            };
        }
        
        //click on canvas
        function  do_click(x,y) {
			if (game_phase=="wait_click") {
                //click to start
				start_click=1;
            }else if (player==0) {
                if (x>300) {
                    //click in the interface
                    if (show_buttons==1) {
                        if (id_icon>0) {
                            if ((x>=300)&&(x<=325)&&(y>=230)&&(y<=258)) {
								createjs.Sound.play("click");
                                click_options(-1);
                            }
                         }
                         if (id_icon<4) {
                            if ((x>=375)&&(x<=400)&&(y>=230)&&(y<=258)) {
								createjs.Sound.play("click");
                                click_options(1);
                            }
                         }
                         if (id_icon==1) {
                            if ((x>=330)&&(x<=370)&&(y>=212)&&(y<=280)) {
								createjs.Sound.play("dynamite");
                                click_dynamite();
                            }
                         }
                    }
                }else{
                    //click in the game area
                    switch(mouse_mode){
                        case "walk":
							createjs.Sound.play("jump");
                            mouse_walk(x,y);
                            break;
                        case "arrow":
                            if (id_icon==2) {
                                //target mode of the missile
                                id_cursor=1;
                                cam_mode="zoomgoal";
                                keep_inside_character=0;
                                mouse_mode="boom";
                                allow_movement_mouse=1;
                                show_buttons=0;
                                cam_zoom_goal=0.3;
                            }else{
                                //clusterbomb
								 createjs.Sound.play("rocket");
                                 do_cluster(x,y);
                            }                            
                            break;
                        case "boom":
                            switch(id_icon){
                               case 2:
                                 //missile
								 createjs.Sound.play("rocket");
                                 do_rocket(x,y);
                                 break;
                               case 4:
                                 //airstrike
                                 do_airstrike(x,y);
                                 break;
                               default:
                                 break;
                            }
                            break;
                        default:
                            break;
                    }
                }
            }
        }
        
        //click to change the options
        function click_options(dd){
            id_icon+=dd;
            keep_inside_character=0;
            switch (id_icon) {
                case 0 :
                    //walk
                    id_cursor=0;
                    allow_movement_mouse=0;
                    cam_mode="follow_character";
                    cam_zoom_goal=0.5;
                    mouse_mode="walk";
                    break;
                case 1 :
                    //dynamite
                    id_cursor=0;
                    allow_movement_mouse=0;
                    cam_zoom_goal=1;
                    cam_mode="follow_character";
                    mouse_mode="walk";
                    break;
                case 2 :
                    //missile
                    id_cursor=1;
                    if (player==0) {
                        allow_movement_mouse=1;
                    }else{
                        allow_movement_mouse=0;
                    }
                    keep_inside_character=1;
                    cam_mode="follow_character";
                    cam_zoom_goal=0.4;
                    mouse_mode="arrow";
                    break;
                case 3 :
                    //clusterbomb
                    id_cursor=1;
                    if (player==0) {
                        allow_movement_mouse=1;
                    }else{
                        allow_movement_mouse=0;
                    }
                    keep_inside_character=1;
                    cam_mode="follow_character";
                    cam_zoom_goal=0.3;
                    mouse_mode="arrow";
                    break;
                case 4 :
                    //airstrike
                    id_cursor=1;
                    cam_mode="zoomgoal";
                    mouse_mode="boom";
                    if (player==0) {
                        allow_movement_mouse=1;
                    }else{
                        allow_movement_mouse=0;
                    }
                    cam_zoom_goal=0.2;
                    break;
                default:
                    break;
            }
        }
        
        //click to drop dynamite
        function click_dynamite() {
                show_buttons=0;
                nb_particles++;
                img=id_sprite_dynamite;
                vx=0;
                vy=0;
                vang=0;
                x=characters[now_char].x;
                y=characters[now_char].y-25;
                w=15;
                h=50;
                sx=0;
                sy=0;
                sw=15;
                sh=50;
                mytype="dynamite";
                properties={dt:200,loop:1,step_max:2,nb_sprite_w:2,sw:15,sh:50,type:mytype};
                particles.push(new particle(nb_particles,"animation",img,x,y,w,h,sx,sy,sw,sh,vx,vy,vang,properties));
                id_cursor=0;
                id_icon=0;
                currenttime= new Date();
                tlasttimer=currenttime.getTime();
                duration_timer=5000;
                str_timer="5";
        }
        
        //airstrike
        function do_airstrike(x,y){
			    createjs.Sound.play("plane");
                if (player==0) {
                    x_airstrike=Math.floor((x-xisland)/zoom);
                }else{
                    x_airstrike=x;
                }
                nb_particles++;
                img=id_sprite_plane;
                vx=5+my_random()*5;
                vy=5+my_random()*5;
                vang=0;
                x=0;
                y=80;
                w=310;
                h=100;
                sx=0;
                sy=0;
                sw=310;
                sh=100;
                currenttime= new Date();
                myt=currenttime.getTime();
                properties={t_smoke:myt,dt_smoke:100,t_bomb:myt,dt_bomb:100,in_reaction:1};
                particles.push(new particle(nb_particles,"airstrike",img,x,y,w,h,sx,sy,sw,sh,vx,vy,vang,properties));
                check_before_wait_end_reaction();
        }
        
        //init a rocket
        function do_rocket(x,y) {
            if (player==0) {
                xx=Math.floor((x-xisland)/zoom);
                yy=Math.floor((y-yisland)/zoom);
            }else{
                xx=x;
                yy=y;
            }
            nb_particles++;
            img=id_sprite_rocket;
            vx=-vx_rocket_init/2;
            vy=-vy_rocket_init/2;
            vang=0;
            x=characters[now_char].x;
            y=characters[now_char].y-32;
            w=92;
            h=32;
            sx=0;
            sy=0;
            sw=w;
            sh=h;
            currenttime= new Date();
            myt=currenttime.getTime();
            properties={gravity:0.5,kx:0.9,ky:0.9,xtarget:xx,ytarget:yy,t_smoke:myt,dt_smoke:75,t_flame:myt,dt_flame:100,in_reaction:1,fire_step_max:5,fire_step:0,fire_x:0,fire_y:0};
            particles.push(new particle(nb_particles,"rocket",img,x,y,w,h,sx,sy,sw,sh,vx,vy,vang,properties));
            check_before_wait_end_reaction();
        }
        
        //init a cluster bomb
        function do_cluster(x,y) {
            xx=Math.floor((x-xisland)/zoom);
            yy=Math.floor((y-yisland)/zoom);
            nb_particles++;
            img=id_sprite_cluster;
            vx=-vx_rocket_init/3;
            vy=-vy_rocket_init/3;
            vang=0;
            x=characters[now_char].x;
            y=characters[now_char].y-32;
            w=64;
            h=32;
            sx=0;
            sy=0;
            sw=w;
            sh=h;
            currenttime= new Date();
            myt=currenttime.getTime();
            properties={cluster:1,no_target:1,kx:0.99,ky:0.98,gravity:2,t_smoke:myt,dt_smoke:75,t_flame:myt,dt_flame:100,in_reaction:1,fire_step_max:5,fire_step:0,fire_x:0,fire_y:0};
            particles.push(new particle(nb_particles,"rocket",img,x,y,w,h,sx,sy,sw,sh,vx,vy,vang,properties));
            check_before_wait_end_reaction();
        }
        
        //a character walks after a click
        function mouse_walk(x,y) {
             if (characters[now_char].action=="wait") {
                xx=Math.floor((x-xisland)*160*20/lxisland);
                yy=Math.floor((y-yisland)*160*10/lyisland);
                dx=(xx-characters[now_char].x)/20;
                dy=(yy-characters[now_char].y)/20;
                characters[now_char].vx=dx;
                characters[now_char].vy=dy;
                if (Math.abs(dx)<=3) {
                    characters[now_char].orient=0;
                }else if (dx>3) {
                    characters[now_char].orient=1;
                }else if (dx<-3) {
                    characters[now_char].orient=2;
                }
                characters[now_char].vang=0;
                characters[now_char].y-=10;
                characters[now_char].action="fall";
             }
        }
        
        //creates explosion
        function  do_explosion(x,y,ray) {
			createjs.Sound.play("explosion");
            currenttime= new Date();
            tlasttimer-=2*duration_timer;
            nb_explosions++;
            //get the image data of the island before to modify it
            xx=Math.floor((x-xisland)*160*20/lxisland);
            yy=Math.floor((y-yisland)*160*10/lyisland);
            if (ray==0) {
                ray=100+Math.floor(my_random()*200);
            }
            ray2=Math.floor(ray/2);
            worldctx.beginPath();
            worldctx.globalCompositeOperation="destination-out";
            worldctx.fillStyle='rgb(255, 0, 0)';
            worldctx.arc(xx,yy,ray2,0,2*Math.PI);
            worldctx.fill();
            worldctx.globalCompositeOperation="source-over";
            nbpixhit=0;
            for(dxc=-ray2;dxc<ray2;dxc++){
                xc=xx+dxc;
                dycmax=Math.floor(Math.sqrt(ray2*ray2-dxc*dxc));
                for(dyc=-dycmax;dyc<dycmax;dyc++){
                       yc=yy+dyc;
                       if ((xc>-1)&&(yc>-1)&&(xc<160*20)&&(yc<160*10)) {
                            i=4*(xc+yc*160*20);
                            if (imgDataDest.data[i+3]>0) {
                                nbpixhit++;
                                imgDataDest.data[i+3]=0;
                            }
                       }
                }
            }
            //create the explosion object
            explosions.push(new explosion(nb_explosions,xx,yy,ray));
            //check the impact on the characters
            for(p=0;p<characters.length;p++){
                if (characters[p].alive==1) {
                    dx=characters[p].x-xx;
                    dy=characters[p].y-yy;
                    dd=dx*dx+dy*dy;
                    if (dd<(ray2+4)*(ray2+4)) {
                        if (dd==0) {
                            dd=1;
                        }
                        dd=Math.sqrt(dd);
                        v=(20+my_random()*20);
                        characters[p].action="fall";
                        characters[p].vx=v*dx/dd;
                        characters[p].vy=-Math.abs(v*dy/dd);
                        characters[p].vang=(my_random()-my_random())*v*4;
						if ((player==0)&&(characters[p].team==1)) {
							//PLAYER SCORES POINTS
                            score+=2;
                        }
                    }
                }
            }
            //rock particles
            nb_particles_rock=Math.floor(nbpixhit/70000*20);
            rockmax=3;
            if (nb_particles_rock>8) {
                rockmax=4;
            }
            if (nb_particles_rock>12) {
                rockmax=5;
            }
            for (p=0;p<nb_particles_rock;p++) {
                nb_particles++;
                img=id_rock_sprite+Math.floor(my_random()*rockmax);
                r=my_random()*ray2;
                ang=my_random()*360*deg;
                vx=r*Math.cos(ang)/2;
                vy=r*Math.sin(ang)/2;
                vang=(my_random()-my_random())*20;
                x=xx+vx/2;
                y=yy+vy/2;
                w=images[img].width;
                h=images[img].height;
                sx=0;
                sy=0;
                sw=images[img].width;
                sh=images[img].height;
                properties={create_splash:1};
                particles.push(new particle(nb_particles,"fall",img,x,y,w,h,sx,sy,sw,sh,vx,vy,vang,properties));
            }
            //check the impact on the trees
            for(p=0;p<trees.length;p++){
                if (trees[p].alive==1) {
                    dx=trees[p].x-xx;
                    dy=trees[p].y-yy;
                    dd=dx*dx+dy*dy;
                    if (dd<(ray2+4)*(ray2+4)) {
                        trees[p].alive=0;
                    }
                }
            }
            //remove the destroyed trees and create particles
            if (trees.length>0) {
                 pos=-1;
                 ok=0;
                 while (ok==0) {
                    pos++;
                    if (trees[pos].alive==0) {
                        dx=2+Math.floor(my_random()*3);
                        dy=2+Math.floor(my_random()*3);
                        img=id_tree_sprite+trees[pos].type;
                        w=Math.floor(images[img].width*2/dx);
                        h=Math.floor(images[img].height*2/dy);
                        xtree=trees[pos].x-images[img].width;
                        ytree=trees[pos].y-images[img].height*2;
                        for(xd=0;xd<dx;xd++){
                            sw=Math.floor(w/2);
                            sx=xd*sw;
                            x=xtree+2*sx;
                            for(yd=0;yd<dy;yd++){
                                 nb_particles++;
                                 sh=Math.floor(h/2);
                                 vx=(my_random()-my_random())*20;
                                 vy=-10-my_random()*20;
                                 vang=(my_random()-my_random())*20;
                                 sy=yd*sh;
                                 y=ytree+2*sy;
                                 properties={create_splash:0};
                                 particles.push(new particle(nb_particles,"fall",img,x,y,w,h,sx,sy,sw,sh,vx,vy,vang,properties));
                            }
                        }
                        trees[pos]=null;
                        trees.splice(pos,1);
                        pos--;
                    }
                    if (pos==trees.length-1) {
                        ok=1;
                    }
                 }
            }
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
			//sounds
			var audioPath = "island/";
            var sounds = [
                 {id:"click", src:"snd_click.mp3"},
                 {id:"dynamite", src:"snd_dynamite.mp3"},
				 {id:"explosion", src:"snd_explosion.mp3"},
				 {id:"rocket", src:"snd_rocket.mp3"},
				 {id:"splash", src:"snd_splash.mp3"},
				 {id:"fall", src:"snd_fall.mp3"},
				 {id:"plane", src:"snd_plane.mp3"},
				 {id:"jump", src:"snd_jump.mp3"},
				 {id:"loop", src:"snd_loop.mp3"},
				 {id:"win", src:"snd_win.mp3"},
				 {id:"loose", src:"snd_loose.mp3"}
            ];
            createjs.Sound.alternateExtensions = ["ogg"];
			createjs.Sound.addEventListener("fileload", handleLoad);
            createjs.Sound.registerSounds(sounds, audioPath);
            //start the loading of the textures
            load_next_media();
        }
		function handleLoad(event) {
           // sounds loaded
		   snd_loop=createjs.Sound.play("loop");
		   snd_loop.loop=-1;
        }
        
        
        //deal with characters
        function deal_with_characters() {
            for(p=0;p<characters.length;p++){
                characters[p].main();
            }
        }
        
        //deal with explosions
        function deal_with_explosions() {
            for(p=0;p<explosions.length;p++){
                explosions[p].main();
            }
            //remove the ended explosions
            if (explosions.length>0) {
                 pos=-1;
                 ok=0;
                 while (ok==0) {
                    pos++;
                    if (explosions[pos].action=="end") {
                        explosions[pos]=null;
                        explosions.splice(pos,1);
                        pos--;
                    }
                    if (pos==explosions.length-1) {
                        ok=1;
                    }
                 }
            }
        }
        
        //deal with particles
        function deal_with_particles() {
            for(p=0;p<particles.length;p++){
                particles[p].main();
            }
        }
        
        //clean the dead particles
        function clean_particles() {
            //remove the dead particles
            if (particles.length>0) {
                 pos=-1;
                 ok=0;
                 while (ok==0) {
                    pos++;
                    if (particles[pos].alive==0) {
                        particles[pos]=null;
                        particles.splice(pos,1);
                        pos--;
                    }
                    if (pos==particles.length-1) {
                        ok=1;
                    }
                 }
            }
        }
        
        
        //mouvement of the camera random
        function cam_move_random() {
             vzoom=0.9*vzoom+(my_random()-my_random())*zoom/200;
             zoom+=vzoom;
             if (zoom<0.1) {
                 zoom=0.1;
                 vzoom=0;
             }
             if (zoom>2) {
                zoom=2;
                vzoom=0;
             }
             cam_calculations();
        }
        
        //camera calculations
        function cam_calculations() {
             lxcam=zoom*(160*20/2);
             lycam=zoom*(160*10/2);
             if (allow_movement_mouse==1) {
                if (dot_mouse.x<300) {
                    vxcam=(xorigine-dot_mouse.x)/25;
                    vycam=(yorigine-dot_mouse.y)/25;
                }else{
                    vxcam=0;
                    vycam=0;
                }
             }
             xcam=xcam+vxcam;
             ycam=ycam+vycam;
             lxcammin=-lxcam-xorigine*zoom;
             lxcammax=lxcam+xorigine*zoom;
             lycammin=-lycam+yorigine*zoom;
             lycammax=lycam-yorigine*zoom;
             if (xcam<lxcammin) {
                xcam=lxcammin;
                vxcam=0;
             }
             if (xcam>lxcammax) {
                xcam=lxcammax;
                vxcam=0;
             }
             if (ycam<lycammin) {
                ycam=lycammin;
                vycam=0;
             }
             if (ycam>lycammax) {
                ycam=lycammax;
                vycam=0;
             }
             if (keep_inside_character==1) {
                xcharmin=lxcam-characters[now_char].x*zoom-xorigine*zoom;
                xcharmax=lxcam-characters[now_char].x*zoom+xorigine*zoom;
                ycharmin=lycam-characters[now_char].y*zoom-yorigine*zoom;
                ycharmax=lycam-characters[now_char].y*zoom+yorigine*zoom;
                if (xcam<xcharmin) {
                    xcam=xcharmin;
                    vxcam=0;
                 }
                 if (xcam>xcharmax) {
                    xcam=xcharmax;
                    vxcam=0;
                 }
                 if (ycam<ycharmin) {
                    ycam=ycharmin;
                    vycam=0;
                 }
                 if (ycam>ycharmax) {
                    ycam=ycharmax;
                    vycam=0;
                 }
             }
        }
        
        //cam following a character
        function cam_follow_character() {            
             xcamgoal=zoom*((160*20/2)-characters[cam_char_goal].x);
             ycamgoal=zoom*((160*10/2)-characters[cam_char_goal].y);
             vxcam=(xcamgoal-xcam)/10;
             vycam=(ycamgoal-ycam)/10;
             cam_zoomgoal();
        }
        
        //cam following a reaction
        function cam_follow_reaction() {
            followed_coordinates=[];
            //get the reacting characters
            for(pos=0;pos<characters_reacting.length;pos++){
                ch=characters_reacting[pos];
                followed_coordinates.push([characters[ch].x,characters[ch].y]);
            }
            //get the reacting particles
            for(pos=0;pos<particles_reacting.length;pos++){
                pa=particles_reacting[pos];
                followed_coordinates.push([particles[pa].x,particles[pa].y]);
            }
             //get the explosions
            for(pos=0;pos<explosions.length;pos++){
                followed_coordinates.push([explosions[pos].x,explosions[pos].y]);
            }
            nb_coordinates=followed_coordinates.length;
            if (nb_coordinates==0) {
                //no more stuff to follow
            }else{
                //there are things to follow
                //find the gravity center for the camera to track it
                xg=0;
                yg=0
                for(pos=0;pos<nb_coordinates;pos++){
                    x=followed_coordinates[pos][0];
                    y=followed_coordinates[pos][1];
                    xg+=x;
                    yg+=y;
                }
                xg=xg/nb_coordinates;
                yg=yg/nb_coordinates;
                //the camera will track the gravity center
                xcamgoal=zoom*((160*20/2)-xg);
                ycamgoal=zoom*((160*10/2)-yg);
                vxcam=(xcamgoal-xcam)/10;
                vycam=(ycamgoal-ycam)/10;
                //find the corners min and max of the rectangle containing all objects to define the zoom goal
                xmin=160*100;
                xmax=-160*100;
                ymin=160*100;
                ymax=-160*100;
                for(pos=0;pos<nb_coordinates;pos++){
                    x=followed_coordinates[pos][0];
                    y=followed_coordinates[pos][1];
                    if (x<xmin) {
                       xmin=x;
                    }
                    if (x>xmax) {
                       xmax=x;
                    }
                    if (y<ymin) {
                       ymin=y;
                    }
                    if (y>ymax) {
                       ymax=y;
                    }
                }
                xmax+=160*2;
                xmin-=160*2;
                ymax+=160*2;
                ymin-=160*2;
                zoom1=300/(xmax-xmin);
                zoom2=300/(ymax-ymin);
                if (zoom1<zoom2) {
                    cam_zoom_goal=zoom1;
                }else{
                    cam_zoom_goal=zoom2;
                }
                cam_zoomgoal();
            }
        }
        
        //cam has just a zoom goal
        function cam_zoomgoal() {
             vzoom=(cam_zoom_goal-zoom)/50;
             zoom+=vzoom;
             if (zoom<0.1) {
                 zoom=0.1;
                 vzoom=0;
             }
             if (zoom>2) {
                zoom=2;
                vzoom=0;
             }
             cam_calculations();
        }
        
        //main camera function
        function cam_move(){
            switch (cam_mode) {
                    case "random":
                        cam_move_random();
                        break;
                    case "stop":
                        cam_calculations();
                        break;
                    case "follow_character":
                        cam_follow_character();
                        break;
                    case "follow_reaction":
                        cam_follow_reaction();
                        break;
                    case "zoomgoal":
                        cam_zoomgoal();
                        break;
                    default:
                        break;
                }
        }
        
        //rendering
        function render() {
          //erase the context
          ctx.clearRect(0,0,300,300);
          //island positions
          lxisland=2*lxcam;
          lyisland=2*lycam;
          xisland=xorigine+xcam-lxcam;
          yisland=yorigine+ycam-lycam;
          if (yisland+lyisland<300) {
            yisland=300-lyisland;
          }
          //mountains positions
          lxmountains=lxisland/2;
          if (lxmountains<300) {
            lxmountains=300;
          }
          lymountains=lxmountains/images[1].width*images[1].height;
          lambda_x=(lxcammax-xcam)/(lxcammax-lxcammin);
          lambda_y=(lycammax-ycam)/(lycammax-lycammin);
          xmountains=-lambda_x*(lxmountains-300);
          ymountains=lambda_y*(yisland+lyisland-lymountains);
          if (ymountains+lymountains<300) {
            ymountains=300-lymountains;
          }
          //render the sky
          xsky-=0.1;
          if (xsky<-skywidth*2) {
            xsky+=skywidth*2;
          }
          xsky0=Math.floor(xsky);
          ctx.drawImage(img_loader[2],xsky0,0,skywidth*2,300);
          if (xsky<300-skywidth*2) {
            ctx.drawImage(img_loader[2],xsky0+skywidth*2,0,skywidth*2,300);
          }
          //render the mountains
          ctx.drawImage(img_loader[1],xmountains,ymountains,lxmountains,lymountains);
          //render the world canvas containing the rock of the island
          ctx.drawImage(worldctx.canvas,xisland,yisland,lxisland,lyisland);
          //render the trees
           for(p=0;p<trees.length;p++){
              x=xisland+trees[p].x/160/20*lxisland;
              y=yisland+trees[p].y/160/10*lyisland;
              img=id_tree_sprite+trees[p].type;
              wtree=images[img].width*2*zoom;
              htree=images[img].height*2*zoom;
              xtree=x-wtree/2;
              ytree=y-htree;
              ctx.drawImage(img_loader[img],xtree,ytree,wtree,htree);
          }
          //render the characters
          currenttime = new Date();
          nowtime=currenttime.getTime();
          for(pp=0;pp<characters.length;pp++){
              if (pp<now_char) {
                p=pp;
              }else if (pp!=characters.length-1) {
                p=pp+1;
              }else{
                p=now_char;
              }
              ok_render=1;
              if (characters[p].alive==1) {
                    x=xisland+characters[p].x/160/20*lxisland;
                    y=yisland+characters[p].y/160/10*lyisland;
                    t=nowtime-characters[p].lasttime;
                    if ((p==now_char)&&(id_icon>=2)&&(id_icon<=3)&&(characters[p].action=="wait")) {
                        //render the main character with a launcher
                        ok_render=0;
                        if (player==1) {
                            if (characters[p].x<160*10) {
                                dot_mouse.x=200;
                            }else{
                                dot_mouse.x=100;
                            }
                            dot_mouse.y=0;
                        }
                        if (mouse_mode=="arrow") {
                            xx=xisland+characters[p].x*zoom-dot_mouse.x;
                            yy=yisland+characters[p].y*zoom-32*zoom-dot_mouse.y;
                            vx_rocket_init=xx;
                            vy_rocket_init=yy;
                            characters[p].ang=Math.atan2(yy,xx);
                            if (xx>0) {
                                characters[p].orient=2;
                            }else{
                                characters[p].orient=1;
                                characters[p].ang-=180*deg;
                            }
                        }
                        //bottom part
                        wperso=64*zoom;
                        hperso=64*zoom;
                        xperso=x-wperso/2;
                        yperso=y-hperso;
                        img=id_perso_launcher_sprite+3*player;
                        ctx.drawImage(img_loader[img],xperso,yperso,wperso,hperso);
                        //top part
                        img+=characters[p].orient;
                        xperso=x;
                        yperso=y-hperso/2;
                        ctx.translate(xperso, yperso);
                        ctx.rotate(characters[p].ang);
                        ctx.drawImage(img_loader[img],-wperso/2,-hperso/2,wperso,hperso);
                        ctx.rotate(-characters[p].ang);
                        ctx.translate(-xperso,-yperso);
                    }
                    if (ok_render==1) {
                        if (t>400) {
                          characters[p].lasttime=nowtime;
                          characters[p].step=(characters[p].step+1)%3;
                        }
                        img=id_perso_sprite+characters[p].team*nb_perso_sprite+characters[p].orient*3+characters[p].step;
                        wperso=64*zoom;
                        hperso=64*zoom;
                        if (characters[p].ang==0) {
                          //character not rotating
                          xperso=x-wperso/2;
                          yperso=y-hperso;
                          ctx.drawImage(img_loader[img],xperso,yperso,wperso,hperso);
                        }else{
                          //character rotating
                          xperso=x;
                          yperso=y-hperso/2;
                          ctx.translate(xperso, yperso);
                          ctx.rotate(characters[p].ang*deg);
                          ctx.drawImage(img_loader[img],-wperso/2,-hperso/2,wperso,hperso);
                          ctx.rotate(-characters[p].ang*deg);
                          ctx.translate(-xperso,-yperso);
                        }
                    }
                    if (p==now_char){
                        xpersonow=xperso;
                        ypersonow=yperso;
                    }
              }
          }
          //render the arrow
          if (game_phase=="play") {
              x=xisland+characters[now_char].x/160/20*lxisland;
              y=yisland+characters[now_char].y/160/10*lyisland;
              t=nowtime/5*deg;
              warrow=64*zoom;
              harrow=64*zoom;
              xarrow=x-warrow/2;
              yarrow=y-(2+Math.abs(Math.cos(t)))*harrow;
              ctx.drawImage(img_loader[id_sprite_arrow],xarrow,yarrow,warrow,harrow);
          }
          //render the water
          waterwidth=lxmountains/1.75;
          waterheight=waterwidth/images[3].width*images[3].height;
          twater+=2*deg;
          xwater=xmountains-waterheight+waterheight*Math.cos(twater);
          ym=ymountains+lymountains;
          if (ym<yisland+lyisland) {
            ym=yisland+lyisland;
          }
          ywater=ym-waterheight+waterheight*Math.abs(Math.sin(twater));
          ctx.drawImage(img_loader[3],xwater,ywater,waterwidth,waterheight);
          ctx.drawImage(img_loader[3],xwater+waterwidth,ywater,waterwidth,waterheight);
          //render the explosions
          for(p=0;p<explosions.length;p++){
              x=xisland+explosions[p].x/160/20*lxisland;
              y=yisland+explosions[p].y/160/10*lyisland;
              wexplosion=explosions[p].ray*zoom;
              hexplosion=explosions[p].ray*zoom;
              xexplosion=x-wexplosion/2;
              yexplosion=y-hexplosion/2;
              uy=Math.floor(explosions[p].step/5);
              ux=explosions[p].step-uy*5;
              sx=ux*64+1;
              sy=uy*64+1;
              ctx.drawImage(img_loader[id_explosion_sprite],sx,sy,63,63,xexplosion,yexplosion,wexplosion,hexplosion);
          }
          //render the particles
          for(p=0;p<particles.length;p++){
              x=xisland+particles[p].x/160/20*lxisland;
              y=yisland+particles[p].y/160/10*lyisland;
              img=particles[p].img;
              wparticle=particles[p].width*zoom;
              hparticle=particles[p].height*zoom;
              xparticle=x;//-wparticle/2;;
              yparticle=y;//-hparticle/2;
              if (particles[p].action=="animation") {
                ddy=Math.floor(particles[p].step/particles[p].properties.nb_sprite_w);
                ddx=particles[p].step-ddy*particles[p].properties.nb_sprite_w;
                swparticle=particles[p].properties.sw;
                shparticle=particles[p].properties.sh;
                sxparticle=ddx*swparticle;
                syparticle=ddy*shparticle;
              }else{
                if (particles[p].action=="rocket") {
                    //particular case : the flame of the rocket
                    xp=xisland+particles[p].properties.fire_x*zoom;
                    yp=yisland+particles[p].properties.fire_y*zoom;
                    ctx.translate(xp,yp);
                    ctx.rotate(particles[p].ang*deg);
                    ctx.drawImage(img_loader[id_sprite_rocket+1],0,particles[p].properties.fire_step*32,32,32,-16,-16,32,32);
                    ctx.rotate(-particles[p].ang*deg);
                    ctx.translate(-xp,-yp);
                }
                sxparticle=particles[p].sx;
                syparticle=particles[p].sy;
                swparticle=particles[p].sw;
                shparticle=particles[p].sh;
              }
              ctx.translate(xparticle, yparticle);
              ctx.rotate(particles[p].ang*deg);
              ctx.drawImage(img_loader[img],sxparticle,syparticle,swparticle,shparticle,-wparticle/2,-hparticle/2,wparticle,hparticle);
              ctx.rotate(-particles[p].ang*deg);
              ctx.translate(-xparticle,-yparticle);
          }
          //render the interface
          ctx.drawImage(img_loader[id_sprite_interface],300,0);
		  ctx.font = "bold 12px Arial";
		  ctx.fillStyle = 'yellow';
          ctx.textAlign="center";
		  ctx.fillText(score,350,22);
          ctx.font = "bold 15px Arial";
          ctx.fillStyle = 'white';
          ctx.textAlign="center"; 
          for(a=0;a<2;a++){
            str=String(nb_char_alive[a]);
            if (str.length==1) {
                str="0"+str;
            }
             ctx.fillText(str,300+(2*a+1)*25+(2*a-1)*2,112);
          }
          if (show_selector==1) {
            ctx.drawImage(img_loader[id_sprite_selector],300+(2*player+1)*25-24+player*3,91-25,46,48);
          }
          if (show_timer==1) {
              ctx.font = "bold 30px Arial";
              ctx.fillText(str_timer,350,170);
          }
          if (show_icons==1) {
                ctx.drawImage(img_loader[id_sprite_icons+id_icon],318,220);
          }
          if (show_buttons==1) {
              if (id_icon>0) {
                 ctx.drawImage(img_loader[id_sprite_buttons],300,244);
              }
              if (id_icon<4) {
                 ctx.drawImage(img_loader[id_sprite_buttons+1],380,244);
              }
          }
          //render the message
          if (show_message==1) {
            ctx.drawImage(img_message,25,25);
          }
          //render the cursors
          if (show_cursors==1) {
            if (dot_mouse.x<300) {
                if (mouse_mode=="arrow") {
                //arrow
                 dx=dot_mouse.x-xpersonow;
                 dy=dot_mouse.y-ypersonow;
                 dd=Math.sqrt(dx*dx+dy*dy);
                 if (dd==0) {
                    dd=1;
                 }
                 dx=dx/dd;
                 dy=dy/dd;
                 x0=xpersonow+dx*36*zoom;
                 y0=ypersonow+dy*36*zoom;
                 if (dd<40) {
                    dd=40;
                 }
                 x1=xpersonow+dx*dd;
                 y1=ypersonow+dy*dd;
                 x2=x1-10*dx+10*dy;
                 y2=y1-10*dy-10*dx;
                 x3=x1-10*dx-10*dy;
                 y3=y1-10*dy+10*dx;
                 ctx.strokeStyle = 'white';
                 ctx.lineWidth=2;
                 ctx.beginPath();
                 ctx.moveTo(x0, y0);
                 ctx.lineTo(x1, y1);
                 ctx.lineTo(x2, y2);
                 ctx.moveTo(x1, y1);
                 ctx.lineTo(x3, y3);
                 ctx.stroke();
              }else{
                //classical cursors
                ctx.drawImage(img_loader[id_sprite_cursors+id_cursor],dot_mouse.x-16,dot_mouse.y-16);
              }
            }
          }
          //render from hidden canvas to the visible one
          ctx2.drawImage(mycanvas,0,0,mycanvas2.width,mycanvas2.height);
        }
        
		//wait for a click to start
        function wait_click() {
            if (start_click==1){
				show_message=0;
                game_phase=next_game_phase;
            }
        }
		
		
        //wait for a duration to last
        function wait_duration() {
            currenttime= new Date();
            if (waitlasttime==null) {
                waitlasttime=currenttime.getTime();
            }
            if (currenttime.getTime()-waitlasttime>waitduration){
                game_phase=next_game_phase;
            }
        }
        
        //check before wait end reaction
        function check_before_wait_end_reaction(){
            show_selector=0;
            show_buttons=0;
            show_icons=0;
            show_cursors=0;
            allow_movement_mouse=0;
            cam_mode="follow_reaction";
            keep_inside_character=0;
            mouse_mode="none";
            next_game_phase="init_next_player";
            game_phase="wait_end_reaction";
            for(pos=0;pos<particles.length;pos++) {
                if ((particles[pos].alive==1)&&(particles[pos].properties.type=="dynamite")) {
                    particles[pos].alive=0;
                    particles[pos].action="dead";
                    xx=particles[pos].x;
                    yy=particles[pos].y;
                    x=xx*zoom+xisland;
                    y=yy*zoom+yisland;
                    do_explosion(x,y,400);
                }
            }
        }
        
        //wait for the camera to be ready
        function wait_end_reaction() {
            ok_reaction=1;
            characters_reacting=[];
            particles_reacting=[];
            for(pos=0;pos<particles.length;pos++) {
                if ((particles[pos].alive==1)&&(particles[pos].properties.in_reaction==1)) {
                    ok_reaction=0;
                    particles_reacting.push(pos);
                }
            }
            for(pos=0;pos<nb_characters;pos++) {
                if ((characters[pos].alive==1)&&(characters[pos].action!="wait")) {
                    ok_reaction=0;
                    characters_reacting.push(pos);
                }
            }
            if (explosions.length!=0) {
                ok_reaction=0;
            }
            if (ok_reaction==1) {
                game_phase=next_game_phase;
            }
            
        }
        
        //the message is loaded
        function loaded_message() {
            show_message=1;
        }
        
        //init message
        function init_message(){
            game_phase="message";
            img_message.onload=loaded_message();
            allow_movement_mouse=1;
            cam_mode="zoomgoal";
            cam_zoom_goal=0.1;
            show_icons=0;
            show_buttons=0;
            show_cursors=0;
            id_icon=0;
            id_cursor=0;
        }
		
		//init start message
		function init_start_message(){
			img_message.src="island/message_start.png";
            img_message.onload=loaded_message();
            allow_movement_mouse=1;
            cam_mode="zoomgoal";
            cam_zoom_goal=0.1;
            show_icons=0;
            show_buttons=0;
            show_cursors=0;
            id_icon=0;
            id_cursor=0;
        }
		
        
        //init the next player and character
        function init_next_player() {
            //check if the game is not finished first
            if ((nb_char_alive[0]==0)&&(nb_char_alive[1]==0)) {
                //draw game
				score=0;
				snd_loop.stop();
				createjs.Sound.play("loose");
                img_message.src="island/message_draw.png";
                post_score(0);
                init_message();
            }else if(nb_char_alive[0]==0){
                //defeat
				score=0;
				snd_loop.stop();
				createjs.Sound.play("loose");
                img_message.src="island/message_defeat.png";
                post_score(0);
                init_message();
            }else if(nb_char_alive[1]==0){
                //victory
				snd_loop.stop();
				createjs.Sound.play("win");
                img_message.src="island/message_victory.png";
                post_score(score);
                init_message();
            }else{
                //the game continues
                characters[now_char].ang=0;
                characters[now_char].orient=0;
                player=1-player;
				bonus_score=0;
                ok=0;
                while (ok==0) {
                    current_character[player]=(current_character[player]+1)%(nb_characters/2);
                    now_char=player*(nb_characters/2)+current_character[player];
                    if (characters[now_char].alive==1) {
                        ok=1;
                    }
                }
                allow_movement_mouse=0;
                keep_inside_character=0;
                cam_mode="follow_character";
                cam_char_goal=now_char;
                cam_zoom_goal=0.5;
                game_phase="play";
                show_icons=1;
                show_selector=1;
                id_icon=0+2*player;
                id_cursor=0;
                if (characters[now_char].team==0) {
                    mouse_mode="walk";
                    show_cursors=1;
                    show_buttons=1;
                }else{
                    mouse_mode="arrow";
                    show_cursors=0;
                    show_buttons=0;
                }
                show_timer=1;
                currenttime= new Date();
                tlasttimer=currenttime.getTime();//-player*17000;
                tlastdecision=currenttime.getTime();
                duration_timer=20000;
                str_timer=String(Math.floor(duration_timer/1000));
            }
        }
        
        
        //CPU change weapon
        function cpu_change_weapon(){
            id_icon=2+Math.floor(my_random()*3);
            if ((id_icon>1)&&(id_icon<5)) {
			   createjs.Sound.play("click");
               click_options(0);
            }
        }
        
        //CPU try use weapon
        function cpu_try_use_weapon(){
            //choose a random target character
            ok=0;
            while (ok==0) {
                target_char=Math.floor(my_random()*nb_characters/2);
                if (characters[target_char].alive==1) {
                    ok=1;
                }
            }
            //use the current weapon to reach the target
            switch (id_icon) {
                case 2:
                    //CPU missile
                    x=characters[target_char].x+(my_random()-my_random())*100;
                    y=characters[target_char].y+(my_random()-my_random())*100;
                    if (y>160*10-50) {
                        y=160*10-50-my_random()*50;
                    }
                    ang=-45-my_random()*90;
                    characters[target_char].ang=ang;
                    rr=80+my_random()*160;
                    vx_rocket_init=-rr*Math.cos(ang*deg);
                    vy_rocket_init=-rr*Math.sin(ang*deg);
					createjs.Sound.play("rocket");
                    do_rocket(x,y);
                    break;
                case 3:
                    //CPU clusterbomb
                    ang=-45-my_random()*90;
                    characters[target_char].ang=ang;
                    rr=100+my_random()*200;
                    vx_rocket_init=-rr*Math.cos(ang*deg);
                    vy_rocket_init=-rr*Math.sin(ang*deg);
					createjs.Sound.play("rocket");
                    do_cluster(0,0);
                    break;
                case 4:
                    //CPU airstrike
                    do_airstrike(characters[target_char].x,characters[target_char].y);
                    break;
                default:
                    break;
            }
            
        }
        
        //CPU MAIN
        function do_cpu_stuff() {
            currenttime= new Date();
            if (currenttime.getTime()-tlastdecision>1000) {
                decision=Math.floor(my_random()*2);
                switch (decision) {
                    case 0:
                        //try use weapon
                        cpu_try_use_weapon();
                        break;
                    default:
                        //change weapon
                        cpu_change_weapon();
                        break;
                }
                tlastdecision=currenttime.getTime();
            }
                
        }
        
        //play
        function play() {
            //CPU ?
            if (player==1) {
                do_cpu_stuff();
            }
            //timer
            currenttime= new Date();
            t=Math.floor((duration_timer-currenttime.getTime()+tlasttimer)/1000);
            if (t<=0) {
                t=0;
                check_before_wait_end_reaction();
            }
            str_timer=String(t);
            if (str_timer.length==1) {
                str_timer="0"+str_timer;
            }
        }
        
        
        //game phases
        function game_phases() {
            switch (game_phase) {
				case "wait_click":
                    wait_click();
                    break;
                case "wait_duration":
                    wait_duration();
                    break;
                case "init_next_player":
                    init_next_player();
                    break;
                case "wait_end_reaction":
                    wait_end_reaction();
                    break;
                case "play":
                    play();
                    break;
                case "message":
                    break;
                default:
                    break;
            }
        }
        
        //main function
        function main() {
          //game phases
          game_phases();
          //explosions
          deal_with_explosions();
          //particles
          deal_with_particles();
          //characters
          deal_with_characters();
          //camera
          cam_move();
          //particles
          clean_particles();
          //rendering
          render();
          //function to call in a loop
          window.requestAnimationFrame(main);
        }
        
        //called when the body is loaded
        window.onload = function () {
           init();           
        }