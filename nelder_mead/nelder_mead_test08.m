function nelder_mead_test08 ( )

%*****************************************************************************80
%
%% NELDER_MEAD_TEST08 runs the McKinnon function.
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
  fprintf ( 1, 'NELDER_MEAD_TEST08:\n' );
  fprintf ( 1, '  Use the McKinnon optimization function.\n' );

  n = 2;

  a = ( 1 + sqrt ( 33 ) ) / 8;
  b = ( 1 - sqrt ( 33 ) ) / 8;

  x = [ 0, 0; ... 
        1, 1; ...
        a, b ];

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
    fprintf ( 1, '  %10e\n', mckinnon ( x(i,1:n) ) );
  end

  [ xopt, n_feval ] = nelder_mead ( x, @mckinnon, 0 );

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
  fprintf ( 1, '  %10e\n', mckinnon ( xopt ) );

  return
end
