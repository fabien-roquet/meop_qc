<<<<<<< HEAD
function [dives,info_ana_dives,varargout]=ana_dives(tdr)
%%  Extraction des plongées et calcul de leurs paramètres
%
% [x,y,z,t,a,b,c,d,e,f]=dives(tdr)
%
% x est le tableau de synthèse des plongées à l'issue de l'analyse des
% données TDR
% y est une structure contenant des informations sur l'identification des
% plongées.
% z, facultatif - noms des colonnes de x.
% t, facultatif - les données tdr avec le statut (surf/plg) mis à jour.
% a, facultatif - noms des colonnes de t.
% b, facultatif - indexes de bébut et fin de plongée (tableau "chg").
% c, facultatif - indexes de bébut et fin de bottom (tableau "daindexes").
% e, facultatif - vitesse verticale lissée.
% f, facultatif - profondeur max et indexes.
%
% *Parametres:*
%
% * pseuil: profondeur a partir de laquelle l'animal est considere en
% plongée.
%
% * startnumb: premier num pour numerotation des plongées.
%
% * plotting1: "1" pour tracer l'histogramme des petites période de surface 
% et de plongée. % Il permet à l'utilisateur de voir quel est le parametre
% "duree" le plus adapté aux données dans chacun des cas.
%
% * dureed: dans le cas ou l'histogramme n'est pas affiché, la valeur par
% defaut du paramètre "durée" pour les périodes de plongée.
% Il s'agit du minimum de temps (en seconde) que doit durer une periode de 
% plongée pour etre considéré comme valide.
%
% * infos: "1" pour afficher les infos a la fin de la fonction.
%
pseuil=15;
startnumb=1;
plotting1=0;
dureed=300;
%disp('ana_dives... (4 steps)');
%% 1°) Identification des phases des plongées
%
resolution=(tdr(2,1)-tdr(1,1))/(1.1574e-05); %détermination de la 
% résolution des données en datenum, 1.1574e-05 correspond à 1 seconde
[chg,tdr,y2,last,dureed]=id_dives(tdr,pseuil,plotting1,dureed);
s=size(tdr); % mise a jour de "s"
tdrtxt={'Ptime Num','Corrected Depth','External Temperature',...
    'Light Level','State','Dive Number'};
varargout(3)={tdrtxt};
%disp('1°) done');
%% 2°) Identification de montées et descentes
%
[depthmax,vert_speed,daduration,daspeed,daindexes]=poly_4_delim_fabien(tdr,chg,dureed);
[sinu]=sinuosity(tdr,depthmax,vert_speed,daindexes);
%disp('2°) done');
%% 3°) Affectation des valeurs dans la matrice 'dives'
%
schg=size(chg);
dives=zeros(schg(2),13);
divestxt={'dive numb','start ptime','start index','dive duration','max depth',...
    'time spent in surface after diving',...
    'desc duration','bottom duration','asc duration','bottom duration residual',...
    'desc speed','asc speed','sinuosity'};
varargout(1)={divestxt};
for k=1:schg(2)
	dives(k,1)=startnumb-1+k; % dive numb
    for i=chg(1,k)+1:chg(2,k)
        tdr(i,s(2))=dives(k,1);
    end
	dives(k,2)=tdr(chg(1,k)+1,1); % start ptime
    dives(k,3)=chg(1,k)+1; % 'start index
	dives(k,4)=(chg(2,k)-chg(1,k))*resolution; % dive duration
	dives(k,5)=depthmax(1,k); % max depth
    if k<schg(2)
		dives(k,6)=(chg(1,k+1)-chg(2,k))*resolution; % time spent in surface after diving
    else
        dives(k,6)=(last-chg(2,k))*resolution; % idem mais pour la dernière plongée
    end
	dives(k,7)=daduration(1,k); % desc duration
	dives(k,8)=dives(k,4)-daduration(1,k)-daduration(2,k); % bottom duration
	dives(k,9)=daduration(2,k); % asc duration
    dives(k,11)=daspeed(1,k); % desc speed
    dives(k,12)=daspeed(2,k); % asc speed
    dives(k,13)=sinu(k); % sinuosity
end
%
% % regression linéaire multiple pour calcul des résidus du bottom time
% % model: Bottom time ~ maxdepth + dive duration
% %
% [betahat,Ibeta,res]=regress(dives(:,8),dives(:,4:5)); %#ok<ASGLU>
% for k=1:schg(2)
%     dives(k,10)=res(k); % bottom duration residual
% end
%disp('3°) done');
%% 4°) Information sur le déroulement de la fonction
%
% & ajouts d'arguments de sortie
%
varargout(2)={tdr};
varargout(4)={chg};
varargout(5)={daindexes};
varargout(6)={vert_speed};
varargout(7)={depthmax};
varargout(8)={resolution};
clear('vert_speed','chg','daduration','depthmax');
info_ana_dives=struct('Seuil_prof', pseuil,...
    'Resolution_TDR',floor(resolution),...
    'Duree_minimale_plongee',dureed,...
    'Nb_plongee_reecrites_en_surface',y2); %#ok<NOPRT>
%disp('4°) done');

=======
function[dives,info_ana_dives,varargout]=ana_dives(tdr)
%%  Extraction des plong�es et calcul de leurs param�tres
%
% [x,y,z,t,a,b,c,d,e,f]=dives(tdr)
%
% x est le tableau de synth�se des plong�es � l'issue de l'analyse des
% donn�es TDR
% y est une structure contenant des informations sur l'identification des
% plong�es.
% z, facultatif - noms des colonnes de x.
% t, facultatif - les donn�es tdr avec le statut (surf/plg) mis � jour.
% a, facultatif - noms des colonnes de t.
% b, facultatif - indexes de b�but et fin de plong�e (tableau "chg").
% c, facultatif - indexes de b�but et fin de bottom (tableau "daindexes").
% e, facultatif - vitesse verticale liss�e.
% f, facultatif - profondeur max et indexes.
%
% *Parametres:*
%
% * pseuil: profondeur a partir de laquelle l'animal est considere en
% plong�e.
%
% * startnumb: premier num pour numerotation des plong�es.
%
% * plotting1: "1" pour tracer l'histogramme des petites p�riode de surface 
% et de plong�e. % Il permet � l'utilisateur de voir quel est le parametre
% "duree" le plus adapt� aux donn�es dans chacun des cas.
%
% * dureed: dans le cas ou l'histogramme n'est pas affich�, la valeur par
% defaut du param�tre "dur�e" pour les p�riodes de plong�e.
% Il s'agit du minimum de temps (en seconde) que doit durer une periode de 
% plong�e pour etre consid�r� comme valide.
%
% * infos: "1" pour afficher les infos a la fin de la fonction.
%
pseuil=2;
startnumb=1;
plotting1=0;
dureed=300;
%disp('ana_dives... (4 steps)');
%% 1�) Identification des phases des plong�es
%
resolution=(tdr(2,1)-tdr(1,1))/(1.1574e-05); %d�termination de la 
% r�solution des donn�es en datenum, 1.1574e-05 correspond � 1 seconde
[chg,tdr,y2,last,dureed]=id_dives(tdr,pseuil,plotting1,dureed);
s=size(tdr); % mise a jour de "s"
tdrtxt={'Ptime Num','Corrected Depth','External Temperature',...
    'Light Level','State','Dive Number'};
varargout(3)={tdrtxt};
%disp('1�) done');
%% 2�) Identification de mont�es et descentes
%
[depthmax,vert_speed,daduration,daspeed,daindexes]=poly_4_delim_fabien(tdr,chg,dureed);
[sinu]=sinuosity(tdr,depthmax,vert_speed,daindexes);
%disp('2�) done');
%% 3�) Affectation des valeurs dans la matrice 'dives'
%
schg=size(chg);
dives=zeros(schg(2),13);
divestxt={'dive numb','start ptime','start index','dive duration','max depth',...
    'time spent in surface after diving',...
    'desc duration','bottom duration','asc duration','bottom duration residual',...
    'desc speed','asc speed','sinuosity'};
varargout(1)={divestxt};
for k=1:schg(2)
	dives(k,1)=startnumb-1+k; % dive numb
    for i=chg(1,k)+1:chg(2,k)
        tdr(i,s(2))=dives(k,1);
    end
	dives(k,2)=tdr(chg(1,k)+1,1); % start ptime
    dives(k,3)=chg(1,k)+1; % 'start index
	dives(k,4)=(chg(2,k)-chg(1,k))*resolution; % dive duration
	dives(k,5)=depthmax(1,k); % max depth
    if k<schg(2)
		dives(k,6)=(chg(1,k+1)-chg(2,k))*resolution; % time spent in surface after diving
    else
        dives(k,6)=(last-chg(2,k))*resolution; % idem mais pour la derni�re plong�e
    end
	dives(k,7)=daduration(1,k); % desc duration
	dives(k,8)=dives(k,4)-daduration(1,k)-daduration(2,k); % bottom duration
	dives(k,9)=daduration(2,k); % asc duration
    dives(k,11)=daspeed(1,k); % desc speed
    dives(k,12)=daspeed(2,k); % asc speed
    dives(k,13)=sinu(k); % sinuosity
end
%
% % regression lin�aire multiple pour calcul des r�sidus du bottom time
% % model: Bottom time ~ maxdepth + dive duration
% %
% [betahat,Ibeta,res]=regress(dives(:,8),dives(:,4:5)); %#ok<ASGLU>
% for k=1:schg(2)
%     dives(k,10)=res(k); % bottom duration residual
% end
%disp('3�) done');
%% 4�) Information sur le d�roulement de la fonction
%
% & ajouts d'arguments de sortie
%
varargout(2)={tdr};
varargout(4)={chg};
varargout(5)={daindexes};
varargout(6)={vert_speed};
varargout(7)={depthmax};
varargout(8)={resolution};
clear('vert_speed','chg','daduration','depthmax');
info_ana_dives=struct('Seuil_prof', pseuil,...
    'Resolution_TDR',floor(resolution),...
    'Duree_minimale_plongee',dureed,...
    'Nb_plongee_reecrites_en_surface',y2); %#ok<NOPRT>
%disp('4�) done');
>>>>>>> b5eae0cac61c969012aa9cc4d9d1bfe867338ef2
