function test00 ( )

%*****************************************************************************80
%
%% TEST00 tries out MATLAB's A\b solver on the data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST00\n' );
  fprintf ( 1, '  Try MATLAB''s A\\b solver on the data.\n' );

  prob_num = p00_prob_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of problems = %d\n', prob_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index     M     N         ||B||     ||X1-X2||         ||X1|| ' );
  fprintf ( 1, '       ||X2||        ||R1||        ||R2||' );
  fprintf ( 1, '\n' );

  for prob = 1 : prob_num

    m = p00_m ( prob );
    n = p00_n ( prob );

    a = p00_a ( prob, m, n );
    b = p00_b ( prob, m );
    x1 = p00_x ( prob, n );

    r1 = a * x1 - b;

    b_norm = norm ( b );
    x1_norm = norm ( x1 );
    r1_norm = norm ( r1 );

    x2 = a \ b;
    r2 = a * x2 - b;
    x2_norm = norm ( x2 );
    r2_norm = norm ( r2 );

    x_diff_norm = norm ( x1 - x2 );

    fprintf ( 1, '  %5d  %4d  %4d  %12.4g  %12.4g  %12.4g  %12.4g  %12.4g  %12.4g\n', ...
      prob, m, n, b_norm, x_diff_norm, x1_norm, x2_norm, r1_norm, r2_norm );

  end

  return
end
