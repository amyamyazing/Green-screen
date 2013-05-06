bg = imread('superboy_bgd.bmp');
fg = imread('superboy.bmp');
[m,n,d] = size(bg);
imwrite(bg, 'output.bmp');
out = imread('output.bmp');
cbkey = 128 - (0.331264 * 255);
crkey = 128 - (0.418688 * 255);
tola = 100;
tolb = 100;
keycolor = [18,155,51];
for i=1:m
    for j = 1:n
        r = double(fg(i,j,1));
        g = double(fg(i,j,2));
        b = double(fg(i,j,3));
        if(r>g && r>b)
            maximum = r;
        elseif (g>b && g>r)
            maximum = g;
        else
            maximum = b;
        end
        if(r<g && r<b)
            minimum = r;
        elseif (g<b && g<r)
            minimum = g;
        else
            minimum = b;
        end       
        h = (maximum + minimum) / 2;
        s = (maximum + minimum) / 2;
        l = (maximum + minimum) / 2;
        if(maximum == minimum)
            h = 0; 
            s = 0;
        else
            d = maximum - minimum;
            if(l>127.5)
                s = d/(510 - maximum - minimum);
            else
                s = d/(maximum + minimum);
            end
            switch(maximum)
                case r
                    if(g<b)
                        t = 6;
                    else
                        t = 0;
                    end
                    h = (g - b) / d + t; 
                case g
                    h = (b - r) / d + 2; 
                case b
                    h = (r - g) / d + 4; 
            end
            h = h/6;       
        end
        h = h*255;
        if (h>=75 && h<=140 && s>=.50 && s<=1.00 && l>=63.75 && l<=127.5)
            mask = 0;

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