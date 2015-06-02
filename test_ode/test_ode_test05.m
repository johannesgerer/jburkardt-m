function test_ode_test05 ( )

%*****************************************************************************80
%
%% TEST_ODE_TEST05 compares the Jacobian to a finite difference estimate.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_ODE_TEST05\n' );
  fprintf ( 1, '  At a random time T in the time interval,\n' );
  fprintf ( 1, '  and a random vector Y, compare the jacobian dF/dY\n' );
  fprintf ( 1, '  and a finite difference estimate.\n' );
  test_num = p00_test_num ( );

  fprintf ( 1, '  The number of tests available is %d\n', test_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test    Difference\n' );
  fprintf ( 1, '\n' );

  e = sqrt ( eps ( ) );
%
%  Solve each problem.
%
  for test = 1 : test_num
%
%  Initialize any problem parameters.
%
    value = p00_param_default ( test );
%
%  Get the number of equations.
%
    neqn = p00_neqn ( test );
%
%  Get the initial and final T and Y.
%
    [ t_start, y_start ] = p00_start ( test, neqn );
    [ t_stop, y_stop ] = p00_stop ( test, neqn );
%
%  Pick a random T and Y in that interval.
%
    seed = 123456789;
    [ t1, seed ] = r8_uniform_ab ( t_start, t_stop, seed );
    [ y1, seed ] = r8vec_uniform_abvec ( neqn, y_start, y_stop, seed );
%
%  Evaluate the exact jacobian.
%
    jac1 = p00_jac ( test, neqn, t1, y1 );
%
%  Estimate the jacobian with finite differences.
%
    jac2 = zeros ( neqn, neqn );

    f1 = p00_fun ( test, neqn, t1, y1 );

    for j = 1 : neqn
      y2(1:neqn,1) = y1(1:neqn,1);
      dy = r8_sign ( y2(j) ) * e * ( abs ( y2(j) ) + 1.0 );
      y2(j) = y2(j) + dy;
      f2 = p00_fun ( test, neqn, t1, y2 );
      jac2(1:neqn,j) = ( f2(1:neqn) - f1(1:neqn) ) / dy;
    end
%
%  Consider the difference.
%
    diff = r8mat_norm_fro_affine ( neqn, neqn, jac1, jac2 );

    fprintf ( 1, '  %2d  %14.6g\n', test, diff );

  end

  return
end


