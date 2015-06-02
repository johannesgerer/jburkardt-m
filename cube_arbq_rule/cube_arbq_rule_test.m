function cube_arbq_rule_test ( )

%*****************************************************************************80
%
%% CUBE_ARBQ_RULE_TEST tests the CUBE_ARBQ_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    08 July 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE_ARBQ_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CUBE_ARBQ_RULE library.\n' );

  degree = 8;
  n = cube_arbq_size ( degree );
  header = 'cube08';

  cube_arbq_rule_test01 ( degree, n );

  cube_arbq_rule_test02 ( degree, n, header );

  cube_arbq_rule_test03 ( degree, n, header );

  cube_arbq_rule_test04 ( degree, n );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE_ARBQ_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
