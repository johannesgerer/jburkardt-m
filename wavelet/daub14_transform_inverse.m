function x = daub14_transform_inverse ( n, y )

%*****************************************************************************80
%
%% DAUB14_TRANSFORM_INVERSE inverts the DAUB14 transform of a vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%    N must be a power of 2 and at least 4.
%
%    Input, real Y(N), the transformed vector.
%
%    Output, real X(N), the original vector.
%
  c = [ ...
     7.785205408500917e-02; ...
     3.965393194819173e-01; ...
     7.291320908462351e-01; ...
     4.697822874051931e-01; ...
    -1.439060039285649e-01; ...
    -2.240361849938749e-01; ...
     7.130921926683026e-02; ...
     8.061260915108307e-02; ...
    -3.802993693501441e-02; ...
    -1.657454163066688e-02; ...
     1.255099855609984e-02; ...
     4.295779729213665e-04; ...
    -1.801640704047490e-03; ...
     3.537137999745202e-04 ];
  p = 13;
  x(1:n,1) = y(1:n);
  m = 4;
  q = floor ( ( p - 1 ) / 2 );

  while ( m <= n )
  
    z(1:m,1) = 0.0;

    j = 1;

    mh = floor ( m / 2 );

    for i = - q + 1 : mh - q
      
      for k = 0 : 2 : p - 1
        i0 = i4_wrap ( i      + k / 2,     1,      mh );
        i1 = i4_wrap ( i + mh + k / 2,     mh + 1, m  );
        z(j,1)   = z(j,1)   + c(p-k)   * x(i0) + c(k+2) * x(i1);
        z(j+1,1) = z(j+1,1) + c(p-k+1) * x(i0) - c(k+1) * x(i1);
      end

      j = j + 2;

    end

    x(1:m,1) = z(1:m);

    m = m * 2;

  end

  return
end
