function rank = vec_gray_rank ( n, base, a )

%*****************************************************************************80
%
%% VEC_GRAY_RANK computes the rank of a product space element.
%
%  Discussion:
%
%    The rank applies only to the elements as produced by the routine
%    VEC_GRAY_NEXT.
%
%  Example:
%
%    N = 2, BASE = (/ 2, 3 /), A = ( 1, 2 ),
%
%    RANK = 4.
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
%    Input, integer A(N), the product space element, with the
%    property that 0 <= A(I) < BASE(I) for each entry I.
%
%    Output, integer RANK, the rank, or order, of the element in
%    the list of all elements.  The rank count begins at 1.
%
  rank = 0;

  for i = 1 : n

    if ( mod ( rank, 2 ) == 1 )
      c = base(i) - a(i) - 1;
    else
      c = a(i);
    end

    rank = base(i) * rank + c;

  end

  rank = rank + 1;

  return
end
