function r8_acosh_test ( )

%*****************************************************************************80
%
%% R8_ACOSH_TEST tests R8_ACOSH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_ACOSH_TEST\n' );
  fprintf ( 1, '  R8_ACOSH computes the arc-hyperbolic-cosine of an angle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            A=R8_ACOSH(X)    COSH(A)\n' );
  fprintf ( 1, '\n' );

  for test = 0 : 8

    x = 1.0 + ( test ) / 2.0;
    a = r8_acosh ( x );
    x2 = cosh ( a );

    fprintf ( 1, '  %14.6g  %14.6g  %14.6g\n', x, a, x2 );

  end

  return
end
