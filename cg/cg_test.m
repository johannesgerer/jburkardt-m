function cg_test ( )

%*****************************************************************************80
%
%% CG_TEST tests the CG library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CG library.\n' );

  n = 10;

  cg_test01 ( n );
  cg_test02 ( );
  cg_test023 ( );
  cg_test025 ( );
  cg_test03 ( );
  cg_test04 ( );
  cg_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
