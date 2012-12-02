function x = ccn_compute_points_np ( n, np, p )

%*****************************************************************************80
%
%% CCN_COMPUTE_POINTS_NP: compute Clenshaw Curtis Nested points.
%
%  Discussion:
%
%    We want to compute the following sequence:
%
%    1/2,
%    0, 1
%    1/4, 3/4
%    1/8, 3/8, 5/8, 7/8,
%    1/16, 3/16, 5/16, 7/16, 9/16, 11/16, 13/16, 15/16, and so on.
%
%    But we'd prefer that the numbers in each row be regrouped in pairs
%    that are symmetric about 1/2, with the number above 1/2 coming first.
%    Thus, the last row might become:
%    (9/16, 7/16), (11/16, 5/16), ..., (15/16, 1/16).
%
%    Once we have our sequence, we apply the Chebyshev transformation
%    which maps [0,1] to [-1,+1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%  Parameters:
%
%    Input, integer N, the number of elements to compute.
%
%    Input, integer NP, the number of parameters.
%
%    Input, real P(NP), the parameters.
%
%    Output, real X(N), the elements of the sequence.
%
  x = ccn_compute_points ( n );

  return
end
