%% MD_POOL uses the MATLABPOOL command to run the MD code.
%
%  Discussion:
%
%    Output printed by the function appears directly on the screen.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MD_POOL:\n' );
  fprintf ( 1, '  Call MD_FUN to simulate a molecular dynamics problem.\n' );

  nd = 3;
  np = 1000;
  step_num = 100;
  dt = 0.1;

  w = 4;

  if ( 0 < w )
    matlabpool ( 'open', 'local', w )
  end

  tic
  [ pe, ke, e_lost ] = md_fun ( nd, np, step_num, dt );
  toc

  if ( 0 < w )
    matlabpool close
  end
