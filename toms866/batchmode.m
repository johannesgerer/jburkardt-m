function batchmode ( testproblem )

%*****************************************************************************80
%
%% BATCHMODE enables batch processing for IFISS test problems.
%
%  Discussion:
%
%    If batchmode terminates prematurely because of an error or
%    execution of cntl-C, interactive input with IFISS may not
%    work correctly.  This is fixed by typing "activemode".
%
%  Usage:
%
%    batchmode ( testproblem );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    Howard Elman, Alison Ramage, David Silvester.
%
%  Reference:
%
%    Howard Elman, Alison Ramage, David Silvester,
%    Finite Elements and Fast Iterative Solvers with
%    Applications in Incompressible Fluid Dynamics,
%    Oxford, 2005,
%    ISBN: 978-0198528678,
%    LC: QA911.E39.
%
%  Parameters:
%
%    Input, string TESTPROBLEM, names the test problem.
%    TESTPROBLEM must be 
%    "P1", "P2", "P3" or "P4" for Poisson problems;
%    "CD1", "CD2", "CD3" or "CD4" for convection-diffusion problems;
%    "S1", "S2", "S3" or "S4" for Stokes problems;
%    "NS1", "NS2", "NS3" or "NS4" for Navier-Stokes problems;
%    "itsolve" for iterative solution of linear systems.
%
  global BATCH FID
%
%  Create the fiiename containing the problem definition.
%
  batchfile = [ testproblem, '_batch.m' ];

  [ FID, message ] = fopen ( batchfile, 'r' );
%
%  Error return on nonexistent or misnamed input file.
%
  if strcmp ( message, '' ) ~= 1
    error(['INPUT FILE ERROR: ' message])
  else
    disp(['Working in batch mode from data file ' batchfile])
  end

  if ~( strncmp(testproblem,'itsolve',7) | ...
        strncmp(testproblem,'P',1) | strncmp(testproblem,'CD',2) | ...
        strncmp(testproblem,'S',1) | strncmp(testproblem,'NS',2) ),
    errmsg = 'INPUT FILE ERROR:\n';
    errmsg = [errmsg,'   Batch input filenames must have the form "*_batch.m"'];
    errmsg = [errmsg,' where "*" begins with\n'];
    errmsg = [errmsg,'   "P"       for generation of Poisson problems\n'];
    errmsg = [errmsg,'   "CD"      for generation of convection-diffusion problems\n'];
    errmsg = [errmsg,'   "S"       for generation of Stokes problems\n'];
    errmsg = [errmsg,'   "NS"      for generation of Navier-Stokes problems\n'];
    errmsg = [errmsg,'   "itsolve" for iterative solution of linear systems.'];
    error('BATCH:err',errmsg);    
  end  
%
%  batch run
%  switch to activate batch mode (off/on 0/1) (see "default.m")
%
  BATCH = 1;
%
%  Run the appropriate driver
%
  if strncmp ( testproblem, 'itsolve', 7 )

    load batchrun
    it_solve
    gohome
    cd datafiles
    save batchrun_itsolve

  else 

    if strncmp ( testproblem, 'P', 1 )  
      diff_testproblem
    elseif strncmp ( testproblem, 'CD', 2 )
      cd_testproblem
    elseif strncmp ( testproblem, 'S', 1 )
      stokes_testproblem   
    elseif strncmp ( testproblem, 'NS', 2 )
      navier_testproblem
    end

    gohome
    cd datafiles
    save batchrun

  end
%
%  Switch back to interactive mode.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BATCHMODE:\n' );
  fprintf ( 1, '  Switching back to interactive mode.\n' );

  activemode

  return
end
