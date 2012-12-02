function f = p00_f ( problem, n, x )

%*****************************************************************************80
%
%% P00_F evaluates the objective function for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Evelyn Beale,
%    On an Iterative Method for Finding a Local Minimum of a Function
%    of More than One Variable,
%    Technical Report 25,
%    Statistical Techniques Research Group,
%    Princeton University, 1958.
%
%    Richard Brent,
%    Algorithms for Minimization with Derivatives,
%    Dover, 2002,
%    ISBN: 0-486-41998-3,
%    LC: QA402.5.B74.
%
%    John Dennis, David Gay, Phuong Vu,
%    A new nonlinear equations test problem,
%    Technical Report 83-16,
%    Mathematical Sciences Department,
%    Rice University (1983 - revised 1985).
%
%    John Dennis, Robert Schnabel,
%    Numerical Methods for Unconstrained Optimization
%    and Nonlinear Equations,
%    SIAM, 1996,
%    ISBN13: 978-0-898713-64-0,
%    LC: QA402.5.D44.
%
%    Noel deVilliers, David Glasser,
%    A continuation method for nonlinear regression,
%    SIAM Journal on Numerical Analysis,
%    Volume 18, 1981, pages 1139-1154.
%
%    Chris Fraley,
%    Solution of nonlinear least-squares problems,
%    Technical Report STAN-CS-1165,
%    Computer Science Department,
%    Stanford University, 1987.
%
%    Chris Fraley,
%    Software performance on nonlinear least-squares problems,
%    Technical Report SOL 88-17,
%    Systems Optimization Laboratory,
%    Department of Operations Research,
%    Stanford University, 1988.
%
%    A Leon,
%    A Comparison of Eight Known Optimizing Procedures,
%    in Recent Advances in Optimization Techniques,
%    edited by Abraham Lavi, Thomas Vogl,
%    Wiley, 1966.
%
%    JJ McKeown,
%    Specialized versus general-purpose algorithms for functions that are sums
%    of squared terms,
%    Mathematical Programming,
%    Volume 9, 1975a, pages 57-68.
%
%    JJ McKeown,
%    On algorithms for sums of squares problems,
%    in Towards Global Optimization,
%    L. C. W. Dixon and G. Szego (eds.),
%    North-Holland, 1975, pages 229-257.
%
%    Zbigniew Michalewicz,
%    Genetic Algorithms + Data Structures = Evolution Programs,
%    Third Edition,
%    Springer Verlag, 1996,
%    ISBN: 3-540-60676-9,
%    LC: QA76.618.M53.
%
%    Jorge More, Burton Garbow, Kenneth Hillstrom,
%    Algorithm 566 - Testing unconstrained optimization software,
%    ACM Transactions on Mathematical Software,
%    Volume 7, 1981, pages 17-41.
%
%    Michael Powell,
%    An Efficient Method for Finding the Minimum of a Function of
%    Several Variables Without Calculating Derivatives,
%    Computer Journal,
%    Volume 7, Number 2, pages 155-162, 1964.
%
%    DE Salane,
%    A continuation approach for solving large residual nonlinear least squares
%    problems,
%    SIAM Journal on Scientific and Statistical Computing,
%    Volume 8, 1987, pages 655-671.
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  if ( problem == 1 )
    f = p01_f ( n, x );
  elseif ( problem == 2 )
    f = p02_f ( n, x );
  elseif ( problem == 3 )
    f = p03_f ( n, x );
  elseif ( problem == 4 )
    f = p04_f ( n, x );
  elseif ( problem == 5 )
    f = p05_f ( n, x );
  elseif ( problem == 6 )
    f = p06_f ( n, x );
  elseif ( problem == 7 )
    f = p07_f ( n, x );
  elseif ( problem == 8 )
    f = p08_f ( n, x );
  elseif ( problem == 9 )
    f = p09_f ( n, x );
  elseif ( problem == 10 )
    f = p10_f ( n, x );
  elseif ( problem == 11 )
    f = p11_f ( n, x );
  elseif ( problem == 12 )
    f = p12_f ( n, x );
  elseif ( problem == 13 )
    f = p13_f ( n, x );
  elseif ( problem == 14 )
    f = p14_f ( n, x );
  elseif ( problem == 15 )
    f = p15_f ( n, x );
  elseif ( problem == 16 )
    f = p16_f ( n, x );
  elseif ( problem == 17 )
    f = p17_f ( n, x );
  elseif ( problem == 18 )
    f = p18_f ( n, x );
  elseif ( problem == 19 )
    f = p19_f ( n, x );
  elseif ( problem == 20 )
    f = p20_f ( n, x );
  elseif ( problem == 21 )
    f = p21_f ( n, x );
  elseif ( problem == 22 )
    f = p22_f ( n, x );
  elseif ( problem == 23 )
    f = p23_f ( n, x );
  elseif ( problem == 24 )
    f = p24_f ( n, x );
  elseif ( problem == 25 )
    f = p25_f ( n, x );
  elseif ( problem == 26 )
    f = p26_f ( n, x );
  elseif ( problem == 27 )
    f = p27_f ( n, x );
  elseif ( problem == 28 )
    f = p28_f ( n, x );
  elseif ( problem == 29 )
    f = p29_f ( n, x );
  elseif ( problem == 30 )
    f = p30_f ( n, x );
  elseif ( problem == 31 )
    f = p31_f ( n, x );
  elseif ( problem == 32 )
    f = p32_f ( n, x );
  elseif ( problem == 33 )
    f = p33_f ( n, x );
  elseif ( problem == 34 )
    f = p34_f ( n, x );
  elseif ( problem == 35 )
    f = p35_f ( n, x );
  elseif ( problem == 36 )
    f = p36_f ( n, x );
  elseif ( problem == 37 )
    f = p37_f ( n, x );
  elseif ( problem == 38 )
    f = p38_f ( n, x );
  elseif ( problem == 39 )
    f = p39_f ( n, x );
  elseif ( problem == 40 )
    f = p40_f ( n, x );
  elseif ( problem == 41 )
    f = p41_f ( n, x );
  elseif ( problem == 42 )
    f = p42_f ( n, x );
  elseif ( problem == 43 )
    f = p43_f ( n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_F - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number PROBLEM = %d\n', problem );
    error ( 'P00_F - Fatal error!' );
  end

  return
end
