function x = daub20_transform_inverse ( n, y )

%*****************************************************************************80
%
%% DAUB20_TRANSFORM_INVERSE inverts the DAUB20 transform of a vector.
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
     2.667005790055555E-02; ...
     1.881768000776914E-01; ...
     5.272011889317255E-01; ...
     6.884590394536035E-01; ...
     2.811723436605774E-01; ...
    -2.498464243273153E-01; ...
    -1.959462743773770E-01; ...
     1.273693403357932E-01; ...
     9.305736460357235E-02; ...
    -7.139414716639708E-02; ...
    -2.945753682187581E-02; ...
     3.321267405934100E-02; ...
     3.606553566956169E-03; ...
    -1.073317548333057E-02; ...
     1.395351747052901E-03; ...
     1.992405295185056E-03; ...
    -6.858566949597116E-04; ...
    -1.164668551292854E-04; ...
     9.358867032006959E-05; ...
    -1.326420289452124E-05 ];
  p = 19;
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
