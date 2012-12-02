function r4lib_test ( )

%*****************************************************************************80
%
%% R4LIB_TEST tests R4LIB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 August 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R4LIB_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the routines in the R4LIB library.\n' );

  r4lib_test001 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R4LIB_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
