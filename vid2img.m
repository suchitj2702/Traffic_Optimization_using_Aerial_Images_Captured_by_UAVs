function I = vid2img(vR, x)
    y = 0;
    while(hasFrame(vR))
        if y == x
            I = readFrame(vR);
            break;
        end
        y = y + 1;
    end
end