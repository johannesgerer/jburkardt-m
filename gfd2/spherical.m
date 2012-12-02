function spherical ( n, m )

%*****************************************************************************80
%
%% SPHERICAL displays a contour plot of a spherical harmonic function.
%
%  Discussion:
%
%    This function is discussed in chapter 19 of the reference.
%
%  Modified:
%
%    02 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
%    Input, integer N, ?
%
%    Input, integer M, ?
%
  K=50;
  [X Y Z]=sphere(K);
  val0=zeros(15,1);
  vali=[0.5:0.5/14:1].';
  vald=[1:-0.5/14:0.5].';
  values = [0.:(1-0.)*1/31:1].';
  valuesb = [1:-(1-0.)*1/31:0.].';
  valuesd=ones(32,1);
  valuesc=zeros(64,1);
  gray = [values values values];

  bluered=[ [vali' valuesd' valuesb' val0']' ...
             [val0' values' valuesb' val0']' ...
             [val0' values' valuesd' vald']' ];

  bluered = [ [val0' values' valuesd' vald']' ...
            [val0' values' valuesb' val0']' ...
            [vali' valuesd' valuesb' val0']'];
%
%  LEGENDRE is in MATLAB's "specfun" specian functions toolbox.
%  p = legendre ( n, x ) evaluates the associated Legendre functions
%  of degree N and orders 0 through N, for -1 <= X <= 1.
%
  for ii=1:K
    for jj=1:K
      R = sqrt(X(ii,jj)*X(ii,jj)+Y(ii,jj)*Y(ii,jj)+Z(ii,jj)*Z(ii,jj));
      mu = sin(Z(ii,jj)/R);
      th = jj/K*2*pi;
      CC = legendre ( n, mu );
      C(ii,jj) = CC(n+1) * cos(m*th);
    end
  end

  clf
  surf ( X, Y, Z, C )
  colormap ( bluered )
  axis equal
  axis off
  title_string = sprintf ( 'legendre ( %d, sin ( Z / R ) ) * cos ( %d * theta )', n, m );
  title ( title_string )

  return
end
