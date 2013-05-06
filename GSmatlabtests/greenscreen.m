bg = imread('superboy_bgd.bmp');
fg = imread('superboy.bmp');
[m,n,d] = size(bg);
imwrite(bg, 'output.bmp');
out = imread('output.bmp');
cbkey = 128 - (0.331 * 255);
crkey = 128 - (0.418 * 255);
tola = 100;
tolb = 200;
keycolor = [18,155,51];
for i=1:m
    for j = 1:n
        out(i, j, 1) = 0;
        out(i, j, 2) = 0;
        out(i, j, 3) = 0;
        r = double(fg(i,j,1));
        g = double(fg(i,j,2));
        b = double(fg(i,j,3));
        cb = 128 + (-0.168*r) - (0.331*g) + (0.5*b);
        cr = 128 + (0.5*r) - (0.418*g) - (0.081*b);
        temp = ((cbkey - cb)^2) + ((crkey - cr)^2);
        if (temp < tola*tola)
            mask = 0;
%         elseif (temp < tolb*tolb)
%             mask = (sqrt(temp) -tola)/(tolb - tola);
        else
            mask = 1;
        end
        mask = 1 - mask;
        out(i,j,1) = fg(i,j,1) - mask*keycolor(1) + bg(i,j,1)*mask;
        out(i,j,2) = fg(i,j,2) - mask*keycolor(2) + bg(i,j,2)*mask;
        out(i,j,3) = fg(i,j,3) - mask*keycolor(3) + bg(i,j,3)*mask;
        
    end
end

imwrite(out, 'output.bmp');
imshow('output.bmp');