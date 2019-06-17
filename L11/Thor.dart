import 'Avenger.dart';
class Thor extends Avenger {
  Thor({String name, String sexual})
      : super.forExtendConstructor(name: name, sexual: sexual){}
      
  @override
  void doSkill() {
    print('''                                                                                          
                                                         .:+ssso+++oo+.                             
                                                      `-+shhhyhyyhsoshh+.                           
                                                    .:osyhyhsyhyo+++++shh+`                         
                                                 `./oyyhyyysys+////////+shh/`                       
                                               `-/syyyyyyyyo/////////////+shy:`                     
                                             .:+oshyyyyyo//////:/::://::://+yhs:                    
                                           ./oyyyyyyys+/:::/:/:::::::::/::://oyhs-                  
                                           /shyyyss+::::::::::::::::://:::::::/oyho-                
                                           /+yyss+:-::::::::::::::::::/::::/::::/ohho.              
                                           //s+/::/::::::::::::::::/://:::::::::::/ohh+.            
                                           /sy+:-:::::::-::::::::::::///::::::::::::/shh+.          
                                           /+sso+::-:::::-::::::::::::::::::::::::::::/shh+.        
                                           :+/osoo/--:::::::::::::::::::::/:::::::::::::/shy/.      
                                           `+-:/oso+/:-:::::::::::::::::://///////::::::::/shy/`    
                                            `.-::+sso/:--::::::::::::::::://////////::/:::::+yhy/`  
                                              `-:::+sso+:::::::::::::::/:::///////////::::/:::+yhy: 
                                                .::::+sso+/:://:::::/://///:////////////:::////+ydd`
                                                 `-:::/ossso//:/::://////////////////////////oyhmmy 
                                                   -////syysso/::///////////////////++/+++oshdmdmmo 
                                                    .+ymdyyyyss+////////++//////////++++oshmdmmmmm/ 
                                                  `:ymdydmmdhyyyso////////++/////////+oyddmmmddmmd. 
                                                `/ydyshNNNNNdyoyysso////////+++/+/++oydmmmdmmmmdo.  
                                              .+hdddmNNNNNdy+/+osyyyso////+//+++++sydmmmmmddmd+.    
                                           `:ymmhhdNNNNmh:``-/+ossyyyso+/++++/++syddmmdddmmh/`      
                                         .+hdhydmNNNmmo-     `+yyyyyyyyys++++oshmdddmmdmmy/`        
                                      `-ohhhmmNNmNNh+`         -shhyyyyyyysoyhddmmmddmmy-`          
                                    `:ymmdmdmNNNmy:              :yhyssshhdddmdmdmdmdo.             
                                  .+ddhyhNNNNmmo.                  /ssoooyhhhhhhdmd+.               
                                .shhyhmNNNmNh/`                     `/osyhhyhhyso:`                 
                             `:ydddmNmNNNms-`                         `---:://-.`                   
                           .odmhyhmNNNmho.                                                          
                        `:shyyymNNNmNh:`                                                            
                      ./yhyhdmNNNNmo-`                                                              
                    -oddhhddNNNNh+.                                                                 
                 `:ydsssmNNNNmy:`                                                                   
               .+yyyodmNNNNmo-`                                                                     
            `-+hhssdmNNNNh+.                                                                        
          `/ydsoshNNNNdy:`                                                                          
        .+yshohmNNNmdo.`                                                                            
     `:ohdyydmNNNmh/.                                                                               
   `/ydysymNNNNds:`                                                                                 
  /hdyyhmmmNNdo.             ````````  ` `    ````     ````         `````         ```````           
  .oydmNNNmy/`              .//:::.`+--:-:`   ../`     `-`/`     `-:-...--.``     `-./----```       
  `/sdNNms-`                `.   .``/   `.    ``/`      .`:     `::`     `..`.     .`/   `.`:       
  /: `:+.                        .`./         ``:.````````:    ``/         . :`    ``/    `.+       
  /:`                            .`./         ` /-.......`:    ``:         ``:.    ``/    ./.       
  :+o:`                          .`./         ``/`      `.:    .`-`        `.+`    ``/  .`:`        
   o+sy:`                        .`./         ``/`      `-:    `...`      `-+.     ` /  `-`.`       
   `y:-sy.                       ``-/         `-/.      .::`     .---.`..-:-`     `.-:.`  ....`     
    -h` :y`                      `.-/`        `..`     ``.``       `.....`        `...``   `-.-.`   
     /y`-N-                     `.-:-.`                                                      .---.  
      o:+N:                                                                                         
       ``-`                                                                                        
    ''');
  }
  void fetchMjolnir(){
    doSkill();
  }
}
