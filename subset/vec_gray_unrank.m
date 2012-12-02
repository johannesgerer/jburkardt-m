function a = vec_gray_unrank ( n, base, rank )

%*****************************************************************************80
%
%% VEC_GRAY_UNRANK computes the product space element of a given rank.
%
%  Discussion:
%
%    The rank applies only to the elements as produced by the routine
%    VEC_GRAY_NEXT.
%
%  Examples:
%
%    N = 2, BASE = ( 2, 3 ), RANK = 4.
%
%    A = ( 1, 2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dennis Stanton, Dennis White,
%    Constructive Combinatorics,
%    Springer, 1986,
%    ISBN: 0387963472,
%    LC: QA164.S79.
%
%  Parameters:
%
%    Input, integer N, the number of components.
%
%    Input, integer BASE(N), contains the number of degrees of
%    freedom of each component.  The output values of A will
%    satisfy 0 <= A(I) < BASE(I).
%
%    Input, integer RANK, the desired rank, or order, of the element in
%    the list of all elements.  The rank count begins at 1 and extends
%    to MAXRANK = Product ( 1 <= I <= N ) BASE(I).
%
%    Output, integer A(N), the product space element of the given rank.
%
  s = rank - 1;

  for i = n : -1 : 1

    a(i) = mod ( s, base(i) );
    s = floor ( s / base(i) );

    if ( mod ( s, 2 ) == 1 )
      a(i) = base(i) - a(i) - 1;
    end

  end

  return
end
