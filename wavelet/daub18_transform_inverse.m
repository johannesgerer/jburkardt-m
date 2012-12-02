function x = daub18_transform_inverse ( n, y )

%*****************************************************************************80
%
%% DAUB18_TRANSFORM_INVERSE inverts the DAUB18 transform of a vector.
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
     3.807794736387834E-02; ...
     2.438346746125903E-01; ...
     6.048231236901111E-01; ...
     6.572880780513005E-01; ...
     1.331973858250075E-01; ...
    -2.932737832791749E-01; ...
    -9.684078322297646E-02; ...
     1.485407493381063E-01; ...
     3.072568147933337E-02; ...
    -6.763282906132997E-02; ...
     2.509471148314519E-04; ...
     2.236166212367909E-02; ...
    -4.723204757751397E-03; ...
    -4.281503682463429E-03; ...
     1.847646883056226E-03; ...
     2.303857635231959E-04; ...
    -2.519631889427101E-04; ...
     3.934732031627159E-05 ];
  p = 17;
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
