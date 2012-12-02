function sandia_sgmgg_test06 ( )

%*****************************************************************************80
%
%% SANDIA_SGMGG_TEST06 demonstrates SANDIA_SGMGG_COEF_INC2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2011
%
%  Author:
%
%    John Burkardt
%
  m = 2;
  n1 = 5;

  c1 = [ +1, +1, +1, -1, -1 ]';
  s1 = [ 
    2, 0; ...
    1, 1; ...
    0, 2; ...
    1, 0; ...
    0, 1 ]';
  s2 = [ 3, 0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_SGMGG_TEST06:\n' );
  fprintf ( 1, '  Predict new coefficients given candidate index.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of items in active set N1 = %d\n', n1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index  Coef   Indices\n' );
  fprintf ( 1, '\n' );

  for j = 1 : n1
    fprintf ( 1, '    %2d  %4d', j, c1(j) );
    for i = 1 : m
      fprintf ( 1, '  %2d', s1(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Candidate:' );
  for i = 1 : m
    fprintf ( 1, '  %2d', s2(i) );
  end
  fprintf ( 1, '\n' );
%
%  Generalized grid in 2D.
%
  c3 = sandia_sgmgg_coef_inc2 ( m, n1, s1, c1, s2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index  Coef  Coef\n' );
  fprintf ( 1, '          Old   New\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n1
    fprintf ( 1, '    %2d  %4d  %4d\n', i, c1(i), c3(i) );
  end

  fprintf ( 1, '    %2d        %4d\n', n1 + 1, c3(n1+1) );
  fprintf ( 1, '    --   ----  ----\n' );
  fprintf ( 1, '  Sum:  %4d  %4d\n', sum ( c1(1:n1) ), sum ( c3(1:n1+1) ) );

  return
end
