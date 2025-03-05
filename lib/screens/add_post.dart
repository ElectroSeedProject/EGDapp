import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  TextEditingController _captionController = TextEditingController();
  XFile? _selectedFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedFile = image;
    });
  }

  Future<void> _pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      _selectedFile = video;
    });
  }

  void _submitPost() {
    if (_captionController.text.isNotEmpty && _selectedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Post Uploaded Successfully!")),
      );
      _captionController.clear();
      setState(() {
        _selectedFile = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select file and enter caption")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _captionController,
              decoration: InputDecoration(
                labelText: "Caption",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            _selectedFile != null
                ? Image.network(_selectedFile!.path, height: 200)
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: Icon(Icons.image),
                  label: Text("Pick Image"),
                ),
                ElevatedButton.icon(
                  onPressed: _pickVideo,
                  icon: Icon(Icons.video_library),
                  label: Text("Pick Video"),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text("Upload Post"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
