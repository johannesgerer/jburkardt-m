function v2 = r8vec_any_normal ( dim_num, v1 )

%*****************************************************************************80
%
%% R8VEC_ANY_NORMAL returns some normal vector to V1.
%
%  Discussion:
%
%    If DIM_NUM < 2, then no normal vector can be returned.
%
%    If V1 is the zero vector, then any unit vector will do.
%
%    No doubt, there are better, more robust algorithms.  But I will take
%    just about ANY reasonable unit vector that is normal to V1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real V1(DIM_NUM,1), the vector.
%
%    Output, real V2(DIM_NUM,1), a vector that is
%    normal to V2, and has unit Euclidean length.
%
  v2 = zeros ( dim_num, 1 );

  if ( dim_num < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_ANY_NORMAL - Fatal error!\n' );
    fprintf ( 1, '  Called with DIM_NUM < 2.\n' );
    error ( 'R8VEC_ANY_NORMAL - Fatal error!' );
  end

  if ( norm ( v1 ) == 0.0 )
    v2(1,1) = 1.0;
    v2(2:dim_num) = 0.0;
    return
  end
%
%  Seek the largest entry in V1, VJ = V1(J), and the
%  second largest, VK = V1(K).
%
%  Since V1 does not have zero norm, we are guaranteed that
%  VJ, at least, is not zero.
%
  j = -1;
  vj = 0.0;

  k = -1;
  vk = 0.0;

  for i = 1 : dim_num

    if ( abs ( vk ) < abs ( v1(i,1) ) | k < 1 )

      if ( abs ( vj ) < abs ( v1(i,1) ) | j < 1 )
        k = j;
        vk = vj;
        j = i;
        vj = v1(i,1);
      else
        k = i;
        vk = v1(i,1);
      end

    end

  end
%
%  Setting V2 to zero, except that V2(J) = -VK, and V2(K) = VJ,
%  will just about do the trick.
%
  v2(j,1) = -vk / sqrt ( vk * vk + vj * vj );
  v2(k,1) =  vj / sqrt ( vk * vk + vj * vj );

  return
end
