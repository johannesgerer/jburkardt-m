function tanh_quad_test02 ( )

%*****************************************************************************80
%
%% TEST02 computes a quadrature rule W, X with N = 5.
%
%  Discussion:
%
%    These results should match the following values reported in
%    Kahaner, Moler and Nash:
%
%       I    Wi         Xi
%      --  --------  --------
%      -5  0.000471  -0.999737
%      -4  0.002807  -0.998428
%      -3  0.016631  -0.990649
%      -2  0.094844  -0.945434
%      -1  0.439127  -0.713098
%       0  0.893459   0.000000
%       1  0.439127   0.713098
%       2  0.094844   0.945434
%       3  0.016631   0.990649
%       4  0.002807   0.998428
%       5  0.000471   0.999737
%
%    Note that these values do not sum to 2, although they come close%
%    Thus, a fundamental feature of most quadrature rules is ignored here.
%    This rule will not integrate f(x) = 1 exactly.  But it is not a
%    family of rules based on polynomial accuracy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TANH_QUAD_TEST02\n' );
  fprintf ( 1, '  Determine specific quadrature rules W, X\n' );
  fprintf ( 1, '  by choosing N = 5, 10, 20.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rule for N = 5 appears in the reference\n' );
  fprintf ( 1, '  Kahaner, Moler and Nash.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Also note that the rule for H(N) means that\n' );
  fprintf ( 1, '  rules for doubled N do not nest.\n' );

  tol = eps;

  n = 5;

  for j = 1 : 3

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Quadrature order N = %d\n', n );

    h = tanh_n_to_h ( n );

    [ x, w ] = tanh_rule ( n, h );

    fprintf ( 1, '\n' );
    fprintf ( 1, '         I      Wi                Xi\n' );
    fprintf ( 1, '\n' );

    offset = n + 1;

    for i = - n : n
      fprintf ( 1, '  %8d  %16e  %16e\n', i, w(i+offset), x(i+offset) );
    end

    n = 2 * n;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Note that the weights do not sum to 2!\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N        sum(W)\n' );
  fprintf ( 1, '\n' );

  n = 5;

  for j = 1 : 5

    h = tanh_n_to_h ( n );

    [ x, w ] = tanh_rule ( n, h );

    offset = n + 1;

    fprintf ( 1, '  %8d  %16.10e\n', n, sum ( w(-n+offset:n+offset) ) );

    n = 2 * n;

  end

  return
end
