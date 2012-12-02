function fmincon_test02 ( )

%*****************************************************************************80
%
%% FMINCON_TEST02 minimizes the Niederreiter-McCurley function 2.
%
%  Discussion:
%
%    The value determined by FMINCON seems highly sensitive to the
%    starting condition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Harald Niederreiter, Kevin McCurley,
%    Optimization of functions by quasi-random search methods,
%    Computing,
%    Volume 22, Number 2, 1979, pages 119-123.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FMINCON_TEST02\n' );
  fprintf ( 1, '  Minimize the negative Niederreiter-McCurley #2 function\n' );

  n = 4;
  lb = [ 0, 0, 0, 0 ];
  ub = [ 1, 1, 1, 1 ];
  x0 = ( lb + ub ) / 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial data:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  ---X(%d)---', j );
  end
  fprintf ( 1, '  ----F(X)----\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %10f', x0(j) );
  end
  fprintf ( 1, '  %12e\n', - niederreiter_mccurley2 ( x0 ) );

  [ x, fval, exitflag, output ] = fmincon ( @niederreiter_mccurley2, x0, ...
    [], [], [], [], lb, ub );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed optimum after %d function evaluations:\n', ...
    output.funcCount );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  ---X(%d)---', j );
  end
  fprintf ( 1, '  ----F(X)----\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %10f', x(j) );
  end
  fprintf ( 1, '  %12e\n', - niederreiter_mccurley2 ( x ) );

  return
end
