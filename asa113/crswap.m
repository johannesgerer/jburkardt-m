function inc = crswap ( a, c, c_size, m, k, n, critvl, i1, i2, c1, c2, ...
  iswitch )

%*****************************************************************************80
%
%% CRSWAP determines the effect of swapping two objects.
%
%  Discussion:
%
%    This computation is very inefficient.  It is only set up so that we
%    can compare algorithm ASA 113 to the K-means algorithms ASA 058 and
%    ASA 136.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Colin Banfield, LC Bassill,
%    Algorithm AS 113:
%    A transfer for non-hierarchichal classification,
%    Applied Statistics,
%    Volume 26, Number 2, 1977, pages 206-210.
%
%  Parameters:
%
%    Input, real  A(M,N), the data values.  There are M objects,
%    each having spatial dimension N.
%
%    Input, integer C(M), the classification of each object.
%
%    Input, integer  C_SIZE(K), the number of objects in each class.
%
%    Input, integer M, the number of objects.
%
%    Input, integer K, the number of classes.
%
%    Input, integer N, the number of spatial dimensions, or variates,
%    of the objects.
%
%    Input, real CRITVL, the current value of the criterion.
%
%    Input, integer I1, I2, the objects to be swapped.
%
%    Input, integer C1, C2, the current classes of objects I1 and I2.
%
%    Input, integer ISWITCH:
%    1, indicates that I1 and I2 should be temporarily swapped, the
%       change in CRITVL should be computed, and then I1 and I2 restored.
%    2, indicates that I1 and I2 will be swapped.
%
%    Output, real INC, the change to CRITVL that would occur if I1 and
%    I2 were swapped.  This is only computed for ISWITCH = 1.
%
  if ( iswitch == 2 )
    inc = 0;
    return
  end
%
%  Move object I1 from class C1 to class C2.
%  Move object I2 from class C2 to class C1.
%
  c(i1) = c2;
  c(i2) = c1;
%
%  Define the critical value as the sum of the squares of the distances
%  of the points to their cluster center.
%
  for i = 1 : k
    c_size(i) = 0;
    for j = 1 : n
      c_center(i,j) = 0.0;
    end
  end

  for i = 1 : m
    ci = c(i);
    c_size(ci) = c_size(ci) + 1;
    for j = 1 : n
      c_center(ci,j) = c_center(ci,j) + a(i,j);
    end
  end

  for i = 1 : k
    for j = 1 : n
      c_center(i,j) = c_center(i,j) / c_size(i);
    end
  end

  for i = 1 : k
    wss(i) = 0.0;
  end

  for i = 1 : m
    ci = c(i);
    for j = 1 : n
      wss(ci) = wss(ci) + ( a(i,j) - c_center(ci,j) )^2;
    end
  end

  critvl_new = 0.0;
  for i = 1 : k
    critvl_new = critvl_new + wss(i);
  end

  inc = critvl_new - critvl;
%
%  Move object I1 from class C2 to class C1.
%  Move object I2 from class C1 to class C2.
%
  c(i1) = c1;
  c(i2) = c2;

  return
end
