function fx = p00_fun ( problem, option, nvar, x )

%*****************************************************************************80
%
%% P00_FUN evaluates the function for any problem.
%
%  Discussion:
%
%    These problems were collected by Professor Werner Rheinboldt, of the
%    University of Pittsburgh, and were used in the development of the
%    PITCON program.
%
%  Index:
%
%     1  The Freudenstein-Roth function
%     2  The Boggs function
%     3  The Powell function
%     4  The Broyden function
%     5  The Wacker function
%     6  The Aircraft stability function
%     7  The Cell kinetic function
%     8  The Riks mechanical problem
%     9  The Oden mechanical problem
%    10  Torsion of a square rod, finite difference solution
%    11  Torsion of a square rod, finite element solution
%    12  The materially nonlinear problem
%    13  Simpson's mildly nonlinear boundary value problem
%    14  Keller's boundary value problem
%    15  The Trigger Circuit
%    16  The Moore-Spence Chemical Reaction Integral Equation
%    17  The Bremermann Propane Combustion System
%    18  The semiconductor problem
%    19  The nitric acid absorption flash
%    20  The Buckling Spring
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Rami Melhem, Werner Rheinboldt,
%    A Comparison of Methods for Determining Turning Points of Nonlinear Equations,
%    Computing,
%    Volume 29, Number 3, September 1982, pages 201-226.
%
%    Werner Rheinboldt,
%    Numerical Analysis of Parameterized Nonlinear Equations,
%    Wiley, 1986,
%    ISBN: 0-471-88814-1,
%    LC: QA372.R54.
%
%    Werner Rheinboldt,
%    Sample Problems for Continuation Processes,
%    Technical Report ICMA-80-?,
%    Institute for Computational Mathematics and Applications,
%    Department of Mathematics,
%    University of Pittsburgh, November 1980.
%
%    Werner Rheinboldt, John Burkardt,
%    A Locally Parameterized Continuation Process,
%    ACM Transactions on Mathematical Software,
%    Volume 9, Number 2, June 1983, pages 215-235.
%
%    Werner Rheinboldt, John Burkardt,
%    Algorithm 596:
%    A Program for a Locally Parameterized
%    Continuation Process,
%    ACM Transactions on Mathematical Software,
%    Volume 9, Number 2, June 1983, pages 236-241.
%
%    Werner Rheinboldt,
%    Computation of Critical Boundaries on Equilibrium Manifolds,
%    SIAM Journal on Numerical Analysis,
%    Volume 19, Number 3, June 1982, pages 653-669.
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the function.
%
%    Output, real FX(NVAR-1), the value of the function at X.
%
  if ( problem == 1 )
    fx = p01_fun ( option, nvar, x );
  elseif ( problem == 2 )
    fx = p02_fun ( option, nvar, x );
  elseif ( problem == 3 )
    fx = p03_fun ( option, nvar, x );
  elseif ( problem == 4 )
    fx = p04_fun ( option, nvar, x );
  elseif ( problem == 5 )
    fx = p05_fun ( option, nvar, x );
  elseif ( problem == 6 )
    fx = p06_fun ( option, nvar, x );
  elseif ( problem == 7 )
    fx = p07_fun ( option, nvar, x );
  elseif ( problem == 8 )
    fx = p08_fun ( option, nvar, x );
  elseif ( problem == 9 )
    fx = p09_fun ( option, nvar, x );
  elseif ( problem == 10 )
    fx = p10_fun ( option, nvar, x );
  elseif ( problem == 11 )
    fx = p11_fun ( option, nvar, x );
  elseif ( problem == 12 )
    fx = p12_fun ( option, nvar, x );
  elseif ( problem == 13 )
    fx = p13_fun ( option, nvar, x );
  elseif ( problem == 14 )
    fx = p14_fun ( option, nvar, x );
  elseif ( problem == 15 )
    fx = p15_fun ( option, nvar, x );
  elseif ( problem == 16 )
    fx = p16_fun ( option, nvar, x );
  elseif ( problem == 17 )
    fx = p17_fun ( option, nvar, x );
  elseif ( problem == 18 )
    fx = p18_fun ( option, nvar, x );
  elseif ( problem == 19 )
    fx = p19_fun ( option, nvar, x );
  elseif ( problem == 20 )
    fx = p20_fun ( option, nvar, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FUN - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized problem number = %d\n', problem );
    error ( 'P00_FUN - Fatal error!' );
  end
%
%  Ensure the result is a COLUMN vector.
%
  fx = fx(:);

  return
end
