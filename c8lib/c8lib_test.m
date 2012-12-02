function c8lib_test ( )

%*****************************************************************************80
%
%% C8LIB_TEST tests C8LIB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 June 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8LIB_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test the routines in the C8LIB library.\n' );

  c8lib_test0061 ( );
  c8lib_test0062 ( );
  c8lib_test0063 ( );
  c8lib_test0064 ( );
  c8lib_test0065 ( );
  c8lib_test0066 ( );
  c8lib_test0067 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8LIB_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
