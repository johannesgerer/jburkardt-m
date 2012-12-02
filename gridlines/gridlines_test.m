function gridlines_test ( )

%*****************************************************************************80
%
%% GRIDLINES_TEST tests the GRIDLINES routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRIDLINES_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the GRIDLINES library.\n' );

  gridlines_test01 ( );
  gridlines_test02 ( );
  gridlines_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRIDLINES_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
