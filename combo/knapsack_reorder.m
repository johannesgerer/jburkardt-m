function [ p, w ] = knapsack_reorder ( n, p, w )

%*****************************************************************************80
%
%% KNAPSACK_REORDER reorders the knapsack data by "profit density".
%
%  Discussion:
%
%    This routine must be called to rearrange the data before calling
%    routines that handle a knapsack problem.
%
%    The "profit density" for object I is defined as P(I)/W(I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer N, the number of objects.
%
%    Input/output, real P(N), the "profit" or value of each object.
%
%    Input/output, real W(N), the "weight" or cost of each object.
%

%
%  Rearrange the objects in order of "profit density".
%
  for i = 1 : n
    for j = i + 1 : n

      if ( p(i) * w(j) < p(j) * w(i) )

        t    = p(i);
        p(i) = p(j);
        p(j) = t;

        t    = w(i);
        w(i) = w(j);
        w(j) = t;

      end

    end
  end

  return
end
