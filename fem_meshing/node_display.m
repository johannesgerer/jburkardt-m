function node_display ( v, bi, p )

%% NODE_DISPLAY displays nodes within a boundary.
%
%  Parameters:
%
%    Input, real V(V_NUM,2), the coordinates of vertices used to define the curves.
%
%    Input, integer BI(BI_NUM), a sequence of indices into V.  Each closed curve
%    is defined by giving a sequence of indices, which is terminated by
%    repeating the starting index.  Thus, BI = { 3, 1, 5, 3, 4, 2, 9, 7, 4 }
%    describes two curves: ( 3, 1, 5, 3 ) and (4, 2, 9, 7, 4 ).
%
%    Input,  real P(P_NUM,2), the coordinates of nodes.
%
  bi_num = length ( bi );

  clf
  hold on;
  next = 1;
  s = bi(1);
  t2 = s;
  draw = 1;

  while ( next < bi_num )
    t1 = t2;
    next = next + 1;
    t2 = bi(next);
    if ( draw )
      line ( [ v(t1,1), v(t2,1) ], [ v(t1,2), v(t2,2) ], 'LineWidth', 2, 'Color', 'k' ); 
      if ( t2 == s )
        draw = 0;
      end
    else
      s = t2;
      draw = 1;
    end

  end 

  plot ( p(:,1), p(:,2), 'b.', 'MarkerSize', 15 );

  plot ( v(:,1), v(:,2), 'r.', 'MarkerSize', 15 );

  axis equal
  grid on
  hold off

  return
end
