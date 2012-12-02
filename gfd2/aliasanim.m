function aliasanim ( n, nper ) 

%*****************************************************************************80
%
%% ALIASANIM demonstrates aliasing.
%
%  Discussion:
%
%    This function is discussed in chapter 1 of the reference.
%
%  Modified:
%
%    30 November 2009
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
%    Input, integer N, the number of initial sampling points per period.
%    The value N = 300 is suggested.
%
%    Input, integer NPER, the number of periods shown for the real signal.
%    The value NPER = 2 is suggested.
%
  if ( 1 <= nargin )
    n = input ( '  Enter N, the number of sampling points (300 suggested).' );
  end

  if ( 2 <= nargin )
    nper = input ( '  Enter NPER, the number of periods dislayed (2 suggested).' );
  end
%
%  Set up the signal data ( T(:), Z(:) ), N values per period, over NPER periods.
%
  for i = 1 : nper * n
    t(i) = ( i - 1 ) * 2 * pi / n;
    z(i) = cos ( t(i) );
  end

  fig = figure;
  set ( fig, 'DoubleBuffer', 'on' );

  for j = 1 : n
%
%  JJ is the number of data samples taken.
%
    jj = n - j + 1
    di = 2*pi/(nper*n)*nper*j*4;

    for i = 1 : jj
      ts(i) = di*(i-1);
      zs(i) = cos(ts(i));
    end
    
    h = plot ( ...
      t,        z,        'k-', ...
      ts(1:jj), zs(1:jj), 'o', ...
      ts(1:jj), zs(1:jj), 'b-' );

    title ( num2str((di/pi)) );
    xlabel ( 'T' );
    ylabel ( 'Z(T)' );

    axis([0 2*nper*pi -1 1])
    %set(h,'LineWidth',2);  % set both lines to 2 pixels wide
    set(h(2),'LineWidth',2)
    set(h(3),'LineWidth',2)
    %set(h(1),'LineWidth',2)
    M(j) = getframe;

  end
%
%  Display the frames as a movie.
%
%  (THIS COMMAND IS FAILING...)
%
  movie ( M )

  return
end
