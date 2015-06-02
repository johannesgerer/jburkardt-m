function quadmom_test ( )

%*****************************************************************************80
%
%% QUADMOM_TEST tests the QUADMOM library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 October 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADMOM_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the QUADMOM library.\n' );

  quadmom_test01 ( );
  quadmom_test02 ( );
  quadmom_test03 ( );
  quadmom_test04 ( );
  quadmom_test05 ( );
  quadmom_test06 ( );
  quadmom_test07 ( );
  quadmom_test08 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADMOM_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

 return
end
