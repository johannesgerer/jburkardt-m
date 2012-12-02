function [ rexp, sexp ] = poly ( code )

%*****************************************************************************80
%
%% POLY returns the polynomial terms associated with any available element.
%
%  Discussion:
%
%    Given coefficients A(I), the polynomial interpolant at (R,S) is
%
%      P(R,S) = sum ( 1 <= I <= N ) A(I) * R**REXP(I) * S**SEXP(I)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CODE(*), identifies the element desired.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL', 'T3',
%    'T6' and 'T10'.
%
%    Output, integer REXP(N), SEXP(N), the powers of R and S associated
%    with each polynomial.  The value of N, the dimension of these
%    arrays, can be determined by a call to ORDER_CODE.
%
  if ( s_eqi ( code, 'Q4' ) )
    [ rexp, sexp ] = poly_q4 ( );
  elseif ( s_eqi ( code, 'Q8' ) )
    [ rexp, sexp ] = poly_q8 ( );
  elseif ( s_eqi ( code, 'Q9' ) )
    [ rexp, sexp ] = poly_q9 ( );
  elseif ( s_eqi ( code, 'Q12' ) )
    [ rexp, sexp ] = poly_q12 ( );
  elseif ( s_eqi ( code, 'Q16' ) )
    [ rexp, sexp ] = poly_q16 ( );
  elseif ( s_eqi ( code, 'QL' ) )
    [ rexp, sexp ] = poly_ql ( );
  elseif ( s_eqi ( code, 'T3' ) )
    [ rexp, sexp ] = poly_t3 ( );
  elseif ( s_eqi ( code, 'T6' ) )
    [ rexp, sexp ] = poly_t6 ( );
  elseif ( s_eqi ( code, 'T10' ) )
    [ rexp, sexp ] = poly_t10 ( );
  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'POLY - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of CODE = "%s"\n', code );
    error ( 'POLY - Fatal error!' );

  end

  return
end
