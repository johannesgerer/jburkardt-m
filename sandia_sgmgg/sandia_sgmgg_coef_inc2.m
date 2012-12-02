function c3 = sandia_sgmgg_coef_inc2 ( m, n1, s1, c1, s2 )

%*****************************************************************************80
%
%% SANDIA_SGMGG_COEF_INC2 computes tentative coefficient changes.
%
%  Discussion:
%
%    An active set S1 of N1 sparse grid indices is given, each of
%    size M.
%
%    The coefficient C1 of each sparse grid index is also given.
%
%    A candidate sparse grid index S2 is provided.
%
%    This function determines the N+1 coefficients that would be
%    appropriate if the candidate S2 was added to the active set
%    as the (N+1)-st item.
%
%  Example:
%
%    Input:
%
%      +1 * {0,2}
%      -1 * {0,1}  +1 * {1,1}
%                  -1 * {1,0}  +1 * {2,0}
%
%    Add {3,0}
%
%    Output:
%
%      +1 * {0,2}
%      -1 * {0,1}  +1 * {1,1}
%                  -1 * {1,0}   0 * {2,0}  +1 * {3,0}
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the dimension of the vector.
%
%    Input, integer N1, the number of points in the active set.
%
%    Input, integer S1(M,N1), the indices for the active set.
%
%    Input, integer C1(N1), the coefficients for the active set.
%
%    Input, integer S2(M), the indices for the candidate.
%
%    Output, integer C3(N1+1), the coefficients for the active set
%    plus the candidate.
%

%
%  During the calculation, we may try to update coefficients of inactive 
%  index sets.  By the end of the calculation, all these inactive index
%  sets should have accumulated total coefficients of 0 again.  As a check,
%  we temporarily set aside space for these objects, and check, at the end,
%  that the coefficients are zero.
%
  n4 = 0;
  c4 = zeros(n1,1);
  s4 = zeros(m,n1);
%
%  Copy C1.
%
  c3(1:n1) = c1(1:n1);
  c3(n1+1) = 1;
%
%  Consider the effect of the new item S2 on each of the current
%  items in the active set S1.
%
  for j = 1 : n1
%
%  Determine S, the element-wise minimum of the J-th item in S1 versus S2.
%
    k = j;

    for i = 1 : m

      if ( s2(i) < s1(i,j) )
        s(i) = s2(i);
        k = - 1;
      else
        s(i) = s1(i,j);
      end

    end
%
%  If S = S1(*,J), K is J.
%
    if ( k ~= -1 )

      c3(k) = c3(k) - c1(j);
%
%  If S is equal to an element of the active set, we set K to that index.
% 
    else

      for j2 = 1 : n1

        k = j2;

        for i2 = 1 : m

          if ( s1(i2,j2) ~= s(i2) )
            k = - 1;
            break
          end

        end

        if ( k ~= - 1 )
          c3(k) = c3(k) - c1(j);
          break
        end

      end

    end
%
%  If S is equal to an element of the inactive set, set K to that index.
%
    if ( k == -1 )

      for j2 = 1 : n4

        k = j2;

        for i2 = 1 : m

          if ( s4(i2,j2) ~= s(i2) )
            k = - 1;
            break
          end

        end

        if ( k ~= - 1 )
          c4(k) = c4(k) - c1(j);
          break
        end

      end

    end
%
%  S is not equal to S1(*,J), or any element of S1, or any element of S4.
%  Add S to the set of elements S4.
%
    if ( k == -1 )
      n4 = n4 + 1;
      k = n4;
      c4(k) = 0;
      s4(1:m,k) = s(1:m);
      c4(k) = c4(k) - c1(j);
    end

  end
%
%  At the end, the C4(1:N4) should all be zero.
%
  if ( any ( c4(1:n4) ~= 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SANDIA_SGMGG_COEF_INC2 - Fatal error!\n' );
    fprintf ( 1, '  Some inactive indices were assigned a nonzero coefficient.\n' );
    i4mat_transpose_print ( m, n4, s4, '  S4:' );
    i4vec_print ( n4, c4, '  C4:' );
    error ( 'SANDIA_SGMGG_COEF_INC2 - Fatal error!' );
  end

  return
end
