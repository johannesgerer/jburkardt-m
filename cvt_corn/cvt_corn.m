function cvt_corn ( )

%*****************************************************************************80
%
%% CVT_CORN models the growth of a corn kernel..
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 December 2012
%
%  Author:
%
%    John Burkardt
%
  alg = 1;

  [ nb, ni, np, ns, pr_bud, pr_bud_angular, r, seed ] = parameter_initialize ( );

  hello ( );
%
%  I don't really want to initialize parameters right now.
%  so leave this commented out.
%
% [ nb, ni, np, ns, pr_bud, pr_bud_angular, r, seed ] = parameter_set ( nb, ...
%   ni, np, ns, pr_bud, pr_bud_angular, r, seed );

  parameter_print ( alg, nb, ni, np, ns, pr_bud, pr_bud_angular, r, seed );

  rng ( seed );

  [ p_xy, p_type ] = state_initialize ( nb, ni, np, r );

  if ( 0 )
    r8mat_transpose_print ( 2, np, p_xy, '  Initial P_XY values:' );
  end

  it = 0;
  header = sprintf ( 'State on step %d, with %d boundary, %d interior, R = %g', ...
    it, nb, ni, r );
  state_display ( nb, ni, np, r, p_xy, p_type, header );
  pause
%
%  1: Update all points at the same time.
%
  if ( alg == 1 )

    p_xy = cvt_disk ( r, ns, np, p_xy, p_type );
    header = sprintf ( ...
      'CVT on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
    cvt_display ( r, p_xy, p_type, header );
    pause
%
%  2: Update circle points.  Then update interior points.
%
  elseif ( alg == 2 )

    p_xy = cvt_circle ( r, np, p_xy, p_type );
    header = sprintf ( ...
      'CVT on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
    cvt_display ( r, p_xy, p_type, header );
    pause

    p_xy = cvt_disk_interior ( r, ns, np, p_xy, p_type );
    header = sprintf ( ...
      'CVT on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
    cvt_display ( r, p_xy, p_type, header );
    pause
%
%  3: Update circle points.  Then update all points.
%
  elseif ( alg == 3 )

    p_xy = cvt_circle ( r, np, p_xy, p_type );
    header = sprintf ( ...
      'CVT on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
    cvt_display ( r, p_xy, p_type, header );
    pause

    p_xy = cvt_disk ( r, ns, np, p_xy, p_type );
    header = sprintf ( ...
      'CVT on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
    cvt_display ( r, p_xy, p_type, header );
    pause

  end

  it = 0;
  while ( it < 30 )

    it = it + 1;
    header = sprintf ( ...
      'State on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
    state_display ( nb, ni, np, r, p_xy, p_type, header );
    pause

    [ nb, ni, np, p_xy, p_type ] = bud ( pr_bud, pr_bud_angular, r, ...
      nb, ni, np, p_xy, p_type );

    [ r, p_xy, p_type ] = radial_growth ( r, np, p_xy, p_type );

    if ( alg == 1 )
      p_xy = cvt_disk ( r, ns, np, p_xy, p_type );
      header = sprintf ( ...
        'CVT on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
      cvt_display ( r, p_xy, p_type, header );
      pause
    elseif ( alg == 2 )
      p_xy = cvt_circle ( r, np, p_xy, p_type );
      header = sprintf ( ...
        'CVT on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
      cvt_display ( r, p_xy, p_type, header );
      pause
      p_xy = cvt_disk_interior ( r, ns, np, p_xy, p_type );
      header = sprintf ( ...
        'CVT on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
      cvt_display ( r, p_xy, p_type, header );
      pause
    elseif ( alg == 3 )
      p_xy = cvt_circle ( r, np, p_xy, p_type );
      header = sprintf ( ...
        'CVT on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
      cvt_display ( r, p_xy, p_type, header );
      pause
      p_xy = cvt_disk ( r, ns, np, p_xy, p_type );
      header = sprintf ( ...
        'CVT on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
      cvt_display ( r, p_xy, p_type, header );
      pause
    end

  end

  it = it + 1;
  header = sprintf ( ...
    'State on step %d, with %d boundary, %d interior, R = %g', it, nb, ni, r );
  state_display ( nb, ni, np, r, p_xy, p_type, header );
  pause

  goodbye ( );

  return
end


