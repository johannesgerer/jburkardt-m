function nelder_mead_test06 ( )

%*****************************************************************************80
%
%% NELDER_MEAD_TEST06 runs the Powell function.
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
  fprintf ( 1, 'NELDER_MEAD_TEST06:\n' );
  fprintf ( 1, '  Use the Powell optimization function.\n' );

  n = 4;

  x = [ 3,  -1,  0,  1; ...
        4,  -1,  0,  1; ...
        3,   0,  0,  1; ...
        3,  -1,  1,  1; ...
        3,  -1,  0,  2 ];

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
    fprintf ( 1, '  %10e\n', powell ( x(i,1:n) ) );
  end

  [ xopt, n_feval ] = nelder_mead ( x, @powell, 0 );

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
  fprintf ( 1, '  %10e\n', powell ( xopt ) );

  return
end
