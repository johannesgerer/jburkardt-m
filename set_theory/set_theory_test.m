function set_theory_test ( )

%*****************************************************************************80
%
%% SET_THEORY_TEST demonstrates some set theory operations in MATLAB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SET_THEORY_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate some set theory operations that\n' );
  fprintf ( 1, '  can be implemented in MATLAB.\n' );

  set_theory_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SET_THEORY_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
