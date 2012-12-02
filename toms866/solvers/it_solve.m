%it_solve    driver for iterative solution of predefined problem
%IFISS scriptfile: AR, HCE, DJS; 15 April 2005. 

if exist('pde','var')==0,
   error('You need to set up a specific discrete problem first!'), 
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
if pde==1,
   %%% DIFFUSION PROBLEM
   fprintf('discrete diffusion system ...\n')

   % select Krylov subspace method
   itmeth = default('PCG/MINRES? 1/2 (default PCG)',1);

   % set parameters
   tol = default('tolerance? (default 1e-6)',1e-6);
   maxit = default('maximum number of iterations? (default 100)',100);
   
   % select preconditioner and construct it
   fprintf('preconditioner:\n');
   fprintf('   0  none\n');
   fprintf('   1  diagonal\n');
   fprintf('   2  incomplete cholesky\n');
   fprintf('   3  geometric multigrid\n');
   precon = default('default is geometric multigrid',3);
   if precon==0,     % none
      M1=[]; M2=[];
   elseif precon==1, % diagonal
      D=diag(diag(Agal)); M1=sqrt(D); M2=M1; 
   elseif precon==2, % incomplete Cholesky
      M2 = cholinc(Agal,'0'); M1=M2';
   elseif precon==3, % MG
      if (domain==1 | domain==2), mg_diff,
      else  error('MG for this problem/domain is not available!')
      end
      M1 = 'm_mg'; M2 = []; 
      mparams=struct('mgdata',mgdata,'smooth_data',smooth_data, ...
                     'nc',nc,'npre',npre,'npost',npost,'sweeps',sweeps);
   else
      error('invalid preconditioner!')
   end
%
   % zero initial guess
   x0=zeros(size(fgal));
   tic %%start timing
   if itmeth==1, %PCG
      fprintf('PCG iteration ...\n');
      if precon<=2, 
         [x_it,flag,relres,iter,resvec] = pcg(Agal,fgal,tol,maxit,M1,M2,x0);
      else
         [x_it,flag,relres,iter,resvec] = ...
            pcg(Agal,fgal,tol,maxit, M1,M2,x0,[],mparams);
      end
   elseif itmeth==2, %MINRES
      fprintf('MINRES iteration ...\n');
      if precon<=2, 
         [x_it,flag,relres,iter,resvec] = minres(Agal,fgal,tol,maxit,M1,M2,x0);
      else
         [x_it,flag,relres,iter,resvec] = ...
            minres(Agal,fgal,tol,maxit,M1,M2,x0,[],mparams);
      end
   else
      error('invalid iterative method!')
   end
   etoc = toc;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
elseif pde==2,
   %%% CONVECTION-DIFFUSION PROBLEM
   fprintf('discrete convection-diffusion system ...\n')
% 
   % set structure for matrix-vector product   
   afun_par = struct('Afun','a_cdt','A',Asupg);
%
   % select Krylov subspace method and set parameters 
   itmeth = default('GMRES/Bicgstab(2)  1/2 (default GMRES)',1);
   tol = default('stopping tolerance? (default 1e-6)',1e-6);
   maxit = default('maximum number of iterations? (default 100)',100);
% 
   % select preconditioner and construct it
   fprintf('preconditioner:\n');
   fprintf('   0  none\n');
   fprintf('   1  diagonal\n');
   fprintf('   2  incomplete LU\n');
   fprintf('   3  geometric multigrid\n');
   fprintf('   4  algebraic multigrid\n');
   precon = default('default is geometric multigrid',3);
   if precon==0,      % none
      mfun_par=struct('Mfun','m_nonet');
   elseif precon==1,  % diagonal
      D=diag(diag(Asupg)); 
      mfun_par=struct('Mfun','m_diagt','D',D);
   elseif precon==2,  % incomplete LU
      [L,U]=ilu0(Asupg); 
      mfun_par=struct('Mfun','m_ilut','L',L,'U',U);
   elseif precon==3,  % MG
      mg_cd
      mfun_par = struct('Mfun','m_mg','mgdata',mgdata,'smooth_data',smooth_data, ...
         'nc',nc,'npre',npre,'npost',npost,'sweeps',sweeps);
   elseif precon==4,  % AMG
      if exist('amgset')==0,
	     error('need to be running FEMLAB for AMG')
      end
      global AMGLOB 
      [AMGNAME,AMGLOB]=amgset(Asupg);
      mfun_par=struct('Mfun','m_amgt');
   else
	  error('invalid preconditioner!')
   end
%
% solve using GMRES or BiCGSTAB(2)
% zero initial guess
   x0=zeros(size(fsupg));
   tic %%start timing
   if itmeth==1, %GMRES
      fprintf('GMRES iteration ...\n');
      params = [tol,maxit,1];
      [x_it,flag,iter,resvec] = gmres_r(afun_par,mfun_par,fsupg,params,x0);
   elseif itmeth==2, %BiCGSTAB(ell)
      fprintf('BiCGSTAB(2) iteration ...\n');
      params = [tol,maxit,2,.7];
      [x_it,flag,iter,resvec] = bicgstab_ell_r(afun_par,mfun_par,fsupg,params,x0);
   else
      error('invalid iterative method!')
   end
   etoc = toc;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
elseif pde==3
   %%% STOKES PROBLEM
   fprintf('discrete Stokes system ...\n')
   % use MINRES as iterative method
   fprintf('iterative solution with preconditioned MINRES\n')
%
   % set parameters
   tol = default('tolerance? (default 1e-6)',1e-6);
   maxit = default('maximum number of iterations? (default 100)',100);
%
   % specify coefficient matrix
   if qmethod<=1, stokes_mat = [Ast,Bst';Bst,-beta*C];
   else           stokes_mat = [Ast,Bst';Bst,sparse(np,np)];
   end
%
   % select preconditioner and construct it
   fprintf('preconditioner:\n');
   fprintf('   0  none\n');
   fprintf('   1  diagonal\n');
   fprintf('   2  ideal block\n');
   fprintf('   3  geometric multigrid block\n');
   precon = default('default is geometric multigrid',3);
   if precon==0,      % none
      fprintf('no preconditioning ...\n') 
      M1=[]; M2=[];  
   elseif precon==1,  % diagonal
      fprintf('diagonal preconditioning ...\n') 
      D=diag([diag(Ast); diag(Q)]); M1=sqrt(D); M2=M1; 
   elseif precon==2,  % block
      fprintf('block (ideal) preconditioning ...\n')
      M1 = 'm_st_block'; M2 = [];
      mparams = struct('Ast',Ast,'Q',Q);
   elseif precon==3,  % MG
      fprintf('multigrid preconditioning ...\n') 
      nv=size(Ast,1); np=size(Q,1); nu=nv/2;
      Agal=Ast(1:nu,1:nu); 
      if (domain==1 | domain==3), mg_diff, 
      else error('MG for this problem/domain is not available!');
      end
      M1 = 'm_st_mg'; M2 = [];
      mparams = struct('nv',size(Ast),'Q',Q,'mgdata',mgdata,...
                    'smooth_data',smooth_data,'nc',nc,'npre',npre,'npost',npost,...
                    'sweeps',sweeps);
   else
	  error('invalid preconditioner!');
   end
%
   fprintf('MINRES iteration ...\n');   
   % zero initial guess
   x0=zeros(size([fst;gst]));
   tic %%start timing
   if precon<=1,
      [x_it,flag,relres,iter,resvec] = ...
         minres(stokes_mat,[fst;gst],tol,maxit, M1,M2,x0);
   else
      [x_it,flag,relres,iter,resvec] = ...
         minres(stokes_mat,[fst;gst],tol,maxit, M1,M2,x0,mparams);
   end
   etoc = toc;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
elseif pde==4
   %%% NAVIER-STOKES Problem
   if     domain==1,  
      fprintf('enclosed flow (cavity) problem ...\n')
   elseif domain==3,  
      fprintf('inflow/outflow (step) problem ...\n')      
   else 
      error('solvers for this problem/domain are not available!');
   end
%
   % set structure for matrix-vector product
   if nlmethod==0,
      % use Oseen matrix from just completed Picard iteration
      fprintf('\nsolving Oseen system generated by solution from last Picard step\n')
      if qmethod>1,
         afun_par = struct('Afun','a_nst','F',Anst,'B',Bst,'D',sparse(np,np));
      else
         afun_par = struct('Afun','a_nst','F',Anst,'B',Bst,'D',-nubeta*C);
      end
   else      
      % use Jacobian of current solution 
      fprintf('\nsolving Jacobian system generated by solution from last Newton step\n')
      if     qmethod>1,  [Nxx,Nxy,Nyx,Nyy] = newton_q2(xy,mv,flowsol);   
      elseif qmethod<=1, [Nxx,Nxy,Nyx,Nyy] = newton_q1(xy,ev,flowsol);
      end
      J = viscosity*A + [N + Nxx, Nxy; Nyx, N + Nyy];
      Jnst = newtonbc(J,xy,bound); 
      if qmethod>1, 
         afun_par = struct('Afun','a_nst','F',Jnst,'B',Bst,'D',sparse(np,np));
      else
         afun_par = struct('Afun','a_nst','F',Jnst,'B',Bst,'D',-nubeta*C);
      end
   end
%
   % select Krylov subspace method and set parameters 
   itmeth = default('\nGMRES/Bicgstab(2)  1/2 (default GMRES)',1);
   tol = default('stopping tolerance? (default 1e-6)',1e-6);
   maxit = default('maximum number of iterations? (default 100)',100);
   
   % select preconditioner
   fprintf('preconditioner:\n');
   fprintf('   0  none\n');
   fprintf('   1  unscaled least-squares commutator (BFBt)\n');
   fprintf('   2  pressure convection-diffusion (Fp)\n');
   fprintf('   3  least-squares commutator\n');
   precon = default('default is pressure convection-diffusion',2);
   if precon>0,
      query = 'ideal / GMG iterated / AMG iterated  preconditioning? 1/2/3 (default ideal)';
      precon_format = default(query,1);
      if (precon_format==3 & exist('amgset')==0),
	     error('need to be running FEMLAB for AMG!')
      end
   else
      precon_format = 1;
   end
%
   % set structure for preconditioner
   n_null = null_pressure_index(domain,qmethod,size(Bst,1));
   if precon==2,      %%%%  Fp: need construction of Ap and Fp blocks
      if qmethod==1,
         %% set up Fp operator for Q0 approximation	   
         [Ap,Fp] = fpsetup_q0(xy,xyp,ev,ee,flowsol,viscosity,domain);	
      elseif qmethod==2
	     %% set up Fp operator for Q1 approximation	   
         [Ap,Fp] = fpsetup_q1(xy,xyp,mv,mp,flowsol,viscosity,domain); 
      elseif qmethod==3
	      %% set up Fp operator for P1 approximation	   
          [Ap,Fp] = fpsetup_q2p1(xy,xyp,mv,ee,flowsol,viscosity,domain);
      elseif qmethod==4
	     %% set up Fp operator for Q0 approximation	   
         [Ap,Fp] = fpsetup_q2p0(xy,xyp,mv,ee,flowsol,viscosity,domain);
      elseif qmethod==0
         %% set up Fp operator for Q1 approximation
         [Ap,Fp] = fpsetup_q1(xy,xyp,ev,ev,flowsol,viscosity,domain);
      end	
   end
   if precon_format==1, 
   % ideal preconditioning: use direct sparse elimination to solve block systems 
   % in preconditioner
      if precon==0,       %%% no preconditioning
         fprintf('no preconditioning ...\n')
         mfun_par=struct('Mfun','m_nonet');
      elseif precon==1,   %%% old (unscaled) least squares (BFBt) 
         fprintf('ideal unscaled least-squares commutator preconditioning ...\n')
         if qmethod>=2  
            mfun_par = struct('Mfun','m_bfbt','domain',domain,'n_null',n_null);
         else 
            error('least squares commutator is not defined for stabilized approximation!')
         end
      elseif precon==2,   %%%%  pressure commutator (Fp) 
         fprintf('ideal pressure convection-diffusion preconditioning ...\n')
         mfun_par = struct('Mfun','m_fp','Fp',Fp,'Ap',Ap,'Mp',Q,'domain',domain,'n_null',n_null);
      else                %%%% precon==3, new (scaled) least squares (BFBt)
         fprintf('ideal least-squares commutator preconditioning ...\n')
         if qmethod>1
            mfun_par = struct('Mfun','m_xbfbt','domain',domain,'G',G,'n_null',n_null);
         elseif qmethod<=1,
            if qmethod==0,
               [Cp1,Cp2] = Cpre_q1q1(xy,ev);
            else
               [Cp1,Cp2] = Cpre_q1p0(xy,xyp,ev,domain);
               Cp1=beta*Cp1; Cp2=beta*Cp2;
            end
            mfun_par = struct('Mfun','m_sxbfbt','domain',domain,'G',G,'Q',Q,...
                              'viscosity',viscosity,'Cp1',Cp1,'Cp2',Cp2,...
                              'n_null',n_null);    
         end
      end
%
   elseif precon_format==2,  
   % iterated preconditioner with geometric multigrid 
   % GMG is implemented on a limited set of problems
      if precon==1,
         errmsg = 'GMG iterated preconditioning is not implemented for ';
         errmsg = [errmsg,'the unscaled least squares method'];
         error('GMG_NS:err1',errmsg);    
      elseif precon==2,
         if (domain==1 | domain==3) & (qmethod==0 | qmethod==2),
            fprintf('GMG iterated pressure convection-diffusion preconditioning ...\n')
            nuv = length(Anst);
            if domain==1, outbnd=NaN; end
            mgdata_diff = mg_ns_diff(Ap,domain,flowsol(1:nuv),qmethod,outbnd);
            mgdata_cd   = mg_ns_cd(domain,viscosity,flowsol(1:nuv),outbnd);
            mfun_par = struct('Mfun','m_fp_mg','Fp',Fp,'Ap',Ap,'Mp',Q, ... 
                              'mgdata_diff',mgdata_diff, 'mgdata_cd',mgdata_cd, ...
                              'domain',domain);
         else
            errmsg = 'GMG iterated pressure convection-diffusion preconditioning is only \n';
            errmsg = [errmsg,'defined for cavity and step with Q1-Q1 or Q2-Q1 '];
            errmsg = [errmsg,'discretization'];
            error('GMG_NS:err2',errmsg);
         end
      elseif precon==3,
         if (domain==1 | domain==3) & (qmethod==2),
            fprintf('GMG iterated least-squares commutator preconditioning ...\n')
            nuv=length(Anst);
            if domain==1, outbnd=NaN; end
            Gdiag=spdiags(diag(G),0,nuv,nuv);
            mgdata_diff = mg_ns_diff_lstsq(Bst*(Gdiag\Bst'), ...
                             domain,flowsol(1:nuv),qmethod,outbnd); 
            mgdata_cd   = mg_ns_cd(domain,viscosity,flowsol(1:nuv),outbnd);
            mfun_par = struct('Mfun','m_xbfbt_mg','G',G, ... 
                              'mgdata_diff',mgdata_diff, 'mgdata_cd',mgdata_cd, ...
                              'domain',domain);
         else
            errmsg = 'GMG iterated least-squares commutator preconditioning is only \n';
            errmsg = [errmsg,'defined for cavity and step with Q2-Q1 discretization'];
            error('GMG_NS:err3',errmsg);             
         end
      end
   %
   else 
   % precon_format==3, iterated preconditioning with algebraic multigrid
      global AMGLOBA
      global AMGLOBF
	  if precon==1,         %%% AMG iterated BFBt
         fprintf('AMG iterated unscaled least-squares commutator preconditioning ...\n')             
         if qmethod>1,
            error('try AMG with scaled least-squares commutator preconditioning instead!')
         else
            error('least squares commutator is not defined for stabilized approximation!')
         end
      elseif precon==2      %%% AMG iterated Fp
         fprintf('AMG iterated pressure convection-diffusion preconditioning ...\n')
		 [AMGNAME,AMGLOBA]=amgset(Ap);
         mfun_par = struct('Mfun','m_fp_amg','Fp',Fp,'Ap',Ap,'Mp', ...
                            diag(diag(Q)),'domain',domain);

      else %%%%precon==2, AMG iterated scaled BFBt
         fprintf('AMG iterated least-squares commutator preconditioning ...\n')
         if qmethod>1,
            Gdiag=spdiags(diag(G),0,2*nv,2*nv);
            [AMGNAME,AMGLOBA]=amgset(Bst*(Gdiag\Bst'));
            mfun_par = struct('Mfun','m_xbfbt_amg','domain',domain,'Gdiag',Gdiag);
         else
            error('least squares commutator is not defined for stabilized approximation!')
         end
      end
      [AMGNAME,AMGLOBF]=amgset(Anst);
   end
%
% solve using GMRES or BiCGSTAB(2)
% zero initial guess
   x0=zeros(size([fst;gst]));
   tic %%start timing
   if itmeth==1, %GMRES 
      fprintf('GMRES iteration ...\n');
      params = [tol,maxit,1];
      [x_it,flag,iter,resvec] = gmres_r(afun_par,mfun_par,nlres,params,x0);
   else %BiCGSTAB(2)
      fprintf('BiCGSTAB(2) iteration ...');
      params = [tol,maxit,2,.7];  
      [x_it,flag,iter,resvec] = bicgstab_ell_r(afun_par,mfun_par,nlres,params,x0);
   end
   etoc = toc;
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Print and plot results
if flag ==0,
   % successful convergence
   fprintf('convergence in %3i iterations\n',iter)
   nr0=resvec(1);
   fprintf('\n    k  log10(||r_k||/||r_0||)   \n')
   for its=1:iter+1,
      fprintf('%5i %16.4f \n', its-1, log10(resvec(its)/nr0));
   end
   fprintf('Bingo!\n')
   fprintf('\n  %9.4e seconds\n\n\n',etoc)  
   %%% plot residual
   resplot(resvec)
else
   nr0=resvec(1);
   fprintf('\n    k  log10(||r_k||/||r_0||)   \n')
   for its=1:iter+1,
      fprintf('%5i %16.4f \n', its-1, log10(resvec(its)/nr0));
   end
   fprintf('iteration aborted! Iteration returned with flag equal to  %2i \n',flag)
   %%% plot residuals
   resplot(resvec)
end
