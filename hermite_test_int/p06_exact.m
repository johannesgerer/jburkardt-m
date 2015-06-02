function exact = p06_exact ( )

%*****************************************************************************80
%
%% P06_EXACT returns the exact integral for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  m = 0;
  m = p06_param ( 'G', 'M', m );

  if ( m <= -1 )

    exact = - r8_huge ( );

  elseif ( mod ( m, 2 ) == 1 )

    exact = 0.0;

  else

    exact = i4_factorial2 ( m - 1 ) * sqrt ( pi ) / 2.0^( m / 2 );

  end

  return
end
