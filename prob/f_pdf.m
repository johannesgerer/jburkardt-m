function pdf = f_pdf ( x, m, n )

%*****************************************************************************80
%
%% F_PDF evaluates the F central PDF.
%
%  Discussion:
%
%    PDF(X)(M,N) = M**(M/2) * X**((M-2)/2)
%      / ( Beta(M/2,N/2) * N**(M/2) * ( 1 + (M/N) * X )**((M+N)/2)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    0.0 <= X
%
%    Input, integer M, N, the parameters of the PDF.
%    1 <= M,
%    1 <= N.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0.0 )

    pdf = 0.0;

  else

    a = m;
    b = n;

    top = sqrt ( m^m * n^n * x^( m - 2 ) );
    bot1 = beta ( m / 2.0, n / 2.0 );
    bot2 =  sqrt ( ( n + m * x )^( m + n ) );

    pdf = top / ( bot1 * bot2 );

  end

  return
end
