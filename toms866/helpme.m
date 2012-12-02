%helpme   IFISS interactive help facility
%   IFISS scriptfile: DJS, HCE; 28 September 2005. 
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage (see readme.m)

fprintf(' \n');
fprintf(' IFISS\n')
fprintf(' Copyright (c) 2005 by D.J. Silvester, H.C. Elman and A. Ramage (see readme.m)\n')
fprintf(' \n');
fprintf(' For the software to run successfully, the script-file\n');
fprintf(' gohome.m must be edited to reflect the correct path\n');
fprintf(' sequence on the installed computer. \n');
fprintf(' \n');
fprintf(' The default implementation is for a Unix architecture. \n');
fprintf(' To install the IFISS software on a Windows PC set gohome.m \n');
fprintf(' and then run the script-file: install_pc.m\n');
fprintf(' Subsequently to run the software you need to execute the \n');
fprintf(' script-file: setpath as soon as you start matlab. \n');
fprintf(' To move a PC version of IFISS to a Unix architecture, set\n');
fprintf(' gohome.m and then run the script-file: install_unix.m\n');
fprintf(' \n');
fprintf(' Howard Elman                          David Silvester\n');
fprintf(' Department of Computer Science        School of Mathematics\n');
fprintf(' University of Maryland                University of Manchester\n');
fprintf(' College Park, Maryland 20742          Sackville Street\n');
fprintf(' USA                                   Manchester M60 1QD  \n');
fprintf(' elman@cs.umd.edu                      United Kingdom\n');
fprintf('                                       na.silvester@na-net.ornl.gov\n');  
fprintf(' \n');
fprintf(' Alison Ramage\n');
fprintf(' Department of Mathematics\n');
fprintf(' University of Strathclyde\n');
fprintf(' 26 Richmond Street\n');
fprintf(' Glasgow  G1 1XH\n');
fprintf(' United Kingdom\n');
fprintf(' a.ramage@strath.ac.uk\n');
fprintf(' \n');

fprintf(' (Type any character to continue.)')
pause;
fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b');

fprintf('\n For further information on\n');
fprintf('    special features                                  enter 0\n');
fprintf('    solving a diffusion problem                             1\n');
fprintf('    solving a convection-diffusion problem                  2\n');
fprintf('    solving a Stokes flow problem                           3\n');
fprintf('    solving a Navier-Stokes flow problem                    4\n');
fprintf('    exploring preconditioned Krylov subspace solvers        5\n');
fprintf('    exploring multigrid solvers                             6\n');

hlp=default('\n Help topic',-1);
if     hlp==1, gohome, cd diffusion, helpme_diff, 
elseif hlp==2, gohome, cd convection, helpme_cd,
elseif hlp==3, gohome, cd stokes_flow, helpme_stokes,
elseif hlp==4, gohome, cd navier_flow, helpme_navier,
elseif hlp==5, gohome, cd solvers, helpme_it,
elseif hlp==6, gohome, cd solvers, helpme_mg,
elseif hlp==0, 
   gohome; helpme_ch4;
   if exist('djs') == 7
      gohome; helpme_djs,
   end
   if exist('hce') == 7
      gohome; helpme_hce,
   end
   if exist('ar') == 7
      gohome; helpme_ar,
   end
end
gohome
fprintf(' \n');
