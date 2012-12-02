function nelder_mead_test02 ( )

%*****************************************************************************80
%
%% NELDER_MEAD_TEST02 runs the Himmelblau function.
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
  fprintf ( 1, 'NELDER_MEAD_TEST02:\n' );
  fprintf ( 1, '  Use the Himmelblau optimization function.\n' );

  n = 2;

  x = [ 3, 4; ... 
       -2, 2; ...
        1, 1 ];

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
    fprintf ( 1, '  %10e\n', himmelblau ( x(i,1:n) ) );
  end

  [ xopt, n_feval ] = nelder_mead ( x, @himmelblau, 0 );

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
  fprintf ( 1, '  %10e\n', himmelblau ( xopt ) );

  return
end
