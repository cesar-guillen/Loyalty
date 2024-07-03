import os
from PIL import Image

def flip_images_in_directory(directory):
    # Iterate through all files in the given directory
    for filename in os.listdir(directory):
        # Check if the file is a PNG image
        if filename.lower().endswith('.png'):
            # Construct the full file path
            file_path = os.path.join(directory, filename)
            
            # Open the image
            with Image.open(file_path) as img:
                # Flip the image horizontally
                flipped_img = img.transpose(Image.FLIP_LEFT_RIGHT)
                
                # Construct the new file name
                new_filename = f"{os.path.splitext(filename)[0]}_l.png"
                new_file_path = os.path.join(directory, new_filename)
                
                # Save the flipped image
                flipped_img.save(new_file_path)
                print(f"Saved flipped image as {new_file_path}")

# Replace 'your_directory_path' with the path to the directory containing the PNG images
directory_path = "."
flip_images_in_directory(directory_path)
