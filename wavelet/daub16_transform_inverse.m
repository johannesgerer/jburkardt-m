function x = daub16_transform_inverse ( n, y )

%*****************************************************************************80
%
%% DAUB16_TRANSFORM_INVERSE inverts the DAUB16 transform of a vector.
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
     5.441584224310400E-02; ...
     3.128715909142999E-01; ...
     6.756307362972898E-01; ...
     5.853546836542067E-01; ...
    -1.582910525634930E-02; ...
    -2.840155429615469E-01; ...
     4.724845739132827E-04; ...
     1.287474266204784E-01; ...
    -1.736930100180754E-02; ...
    -4.408825393079475E-02; ...
     1.398102791739828E-02; ...
     8.746094047405776E-03; ...
    -4.870352993451574E-03; ...
    -3.917403733769470E-04; ...
     6.754494064505693E-04; ...
    -1.174767841247695E-04 ];
  p = 15;
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
