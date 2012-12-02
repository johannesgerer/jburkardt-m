function nelder_mead_test03 ( )

%*****************************************************************************80
%
%% NELDER_MEAD_TEST03 runs the extended Rosenbrock function.
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
%    Jeff Borggaard
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NELDER_MEAD_TEST03:\n' );
  fprintf ( 1, '  Use the extended Rosenbrock optimization function.\n' );

  n = 4;

  x = [ -1,  0,  3,  1; ...
         2,  1, -2,  0; ...
         0,  0,  0,  0; ...
         1,  3, -2,  1; ...
        -1, -1, -1, -1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial data:\n' );
  fprintf ( 1, '\n' );

  for j = 1 : n
    fprintf ( 1, '  ---X(%d)---', j );
  end
  fprintf ( 1, '  ---F(X)---\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n + 1
    for j = 1 : n
      fprintf ( 1, '  %10f', x(i,j) );
    end
    fprintf ( 1, '  %10e\n', extended_rosenbrock ( x(i,1:n) ) );
  end

  [ xopt, n_feval ] = nelder_mead ( x, @extended_rosenbrock, 0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed optimum after %d evaluations:\n', n_feval );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  ---X(%d)---', j );
  end
  fprintf ( 1, '  ---F(X)---\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %10f', xopt(j) );
  end
  fprintf ( 1, '  %10e\n', extended_rosenbrock ( xopt ) );

  return
end
