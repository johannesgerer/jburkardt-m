function nelder_mead_test05 ( )

%*****************************************************************************80
%
%% NELDER_MEAD_TEST05 runs the Beale function.
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
  fprintf ( 1, 'NELDER_MEAD_TEST05:\n' );
  fprintf ( 1, '  Use the Beale optimization function.\n' );

  n = 2;

  x = [  1,  4; ...
         2,  3; ...
         1, -4 ];

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
    fprintf ( 1, '  %10e\n', beale ( x(i,1:n) ) );
  end

  [ xopt, n_feval ] = nelder_mead ( x, @beale, 0 );

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
  fprintf ( 1, '  %10e\n', beale ( xopt ) );

  return
end
