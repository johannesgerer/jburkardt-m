function asa053_test02 ( )

%*****************************************************************************80
%
%% TEST02 averages many Wishart samples.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA053_TEST02\n' );
  fprintf ( 1, '  Average many Wishart deviates.\n' );
  fprintf ( 1, '  Compare to D'' * D * np / n.\n' );

  d = [ ...
    3.0, ...
    2.0, 4.0, ...
    1.0, 2.0, 5.0 ];
  n = 2;
  np = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of variables is %d\n', np );
  fprintf ( 1, '  The number of degrees of freedom is %d\n', n );

  r8utp_print ( np, d, '  The upper Cholesky factor:' );

  s_average = zeros ( ( np * ( np + 1 ) ) / 2 );

  test_num = 100000;
  for i = 1 : test_num
    [ sa, seed ] = wshrt ( d, n, np, seed );
    s_average = s_average + sa;
  end

  s_average = s_average / test_num;

  r8pp_print ( np, s_average, '  The averaged matrix:' );
%
%  Compare the result to ( D' * D ) * np / n.
%
  sigma = zeros ( np, np );
  for i = 1 : np
    for j = 1 : np
      for k = 1 : min ( i, j )
        ki = k + ( i * ( i - 1 ) ) / 2;
        kj = k + ( j * ( j - 1 ) ) / 2;
        sigma(i,j) = sigma(i,j) + d(ki) * d(kj);
      end
      sigma(i,j) = sigma(i,j) * np / n;
    end
  end

  r8mat_print ( np, np, sigma, '  Expected result:' );

  return
end

