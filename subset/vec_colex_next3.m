function [ a, more ] = vec_colex_next3 ( dim_num, base, a, more )

%*****************************************************************************80
%
%% VEC_COLEX_NEXT3 generates vectors in colex order.
%
%  Discussion:
%
%    The vectors are produced in colexical order, starting with
%    (1,1,...,1),
%    (2,1,...,1),
%    ...
%    (BASE(1),BASE(2),...,BASE(DIM_NUM)).
%
%  Example:
%
%    DIM_NUM = 2, 
%    BASE = [ 3, 3]
%
%    1   1
%    2   1
%    3   1
%    1   2
%    2   2
%    3   2
%    1   3
%    2   3
%    3   3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer BASE(DIM_NUM), the base to be used in each dimension.
%
%    Input, integer A(DIM_NUM), except on the first call, this should
%    be the output value of A on the last call.
%
%    Input, logical MORE, should be FALSE on the first call, and
%    thereafter should be the output value of MORE from the previous call.  
%
%    Output, integer A(DIM_NUM), the next vector.
%
%    Output, logical MORE, is TRUE if another vector was computed.
%    If MORE is FALSE on return, then ignore the output value A, and
%    stop calling the routine.
%
  if ( ~more )

    a(1:dim_num) = 1;
    more = 1;

  else
      
    for i = 1 : dim_num

      a(i) = a(i) + 1;

      if ( a(i) <= base(i) )
        return
      end

      a(i) = 1;

    end

    more = 0;

  end

  return
end
