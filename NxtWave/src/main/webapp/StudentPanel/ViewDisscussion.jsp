<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="NewLayout.jsp" %>
    <div class="container py-3 mb-0">
        <div class="customBorderedBox px-5 py-4 mb-3">
            <div class="d-flex flex-md-row flex-column justify-content-md-between mb-2">
                <p class="disscussion-info">From: MK Vemula</p>
                <p class="disscussion-info">at: 15 Jan, 2025</p>
            </div>
            <div class="pb-5" id="output-container">
                <h1>Prioritize showing your users</h1>
                <h2>Prioritize showing your users</h2>
                <h3>Prioritize showing your users</h3>
                <h4>Prioritize showing your users</h4>
                <p>
                    This course is designed to take you from a beginner to an advanced level in
                    Python for Data Science. You will learn the fundamentals of Python programming, data manipulation,
                    data visualization, and machine learning. By the end of this course, you will have a solid
                    understanding
                    of Python and its applications in data science. You will learn the fundamentals of Python
                    programming, data
                    manipulation, data visualization, and machine learning. By the end of this course, you will have a
                    solid
                    understanding of Python and its applications in data science.
                </p>
                <img src="../Assets/Images/CH.png" alt="">
                <ol>
                    <li>x</li>
                    <li>x</li>
                    <li>x</li>
                    <li>x</li>
                </ol>
                <ul>
                    <li>x</li>
                    <li>x</li>
                    <li>x</li>
                    <li>x</li>
                    <li>x</li>
                </ul>
                <blockquote>
                    This course is designed to take you from a beginner to an advanced level in Python for Data Science.
                    You
                    will learn the fundamentals of Python programming, data manipulation, data visualization, and
                    machine
                    learning. By the end of this course, you will have a solid understanding of Python and its
                    applications in
                    data science.
                    You will learn the fundamentals of Python programming, data manipulation, data visualization, and
                    machine
                    learning. By the end of this course, you will have a solid understanding of Python and its
                    applications in
                    data science.
                </blockquote>
                <p>For more information, visit the <a href="https://www.nxtwave.ai/">Nxt Wave</a> website.</p>
                <pre><code>def hello_world():
                    print("Hello, World!")
                    </code></pre>
            </div>
        </div>
        <div class="customBorderedBox px-5 py-4 mb-3">
            <div class="d-flex flex-row"></div>
            <div class="d-flex flex-md-row flex-column justify-content-md-between mb-2">
                <p class="disscussion-info">From: MK Vemula</p>
                <p class="disscussion-info">Response At: 15 Jan, 2025</p>
            </div>
            <div class="pb-5" id="output-container">
                <h1>Prioritize showing your users</h1>
                <h2>Prioritize showing your users</h2>
                <h3>Prioritize showing your users</h3>
                <h4>Prioritize showing your users</h4>
                <p>
                    This course is designed to take you from a beginner to an advanced level in
                    Python for Data Science. You will learn the fundamentals of Python programming, data manipulation,
                    data visualization, and machine learning. By the end of this course, you will have a solid
                    understanding
                    of Python and its applications in data science. You will learn the fundamentals of Python
                    programming, data
                    manipulation, data visualization, and machine learning. By the end of this course, you will have a
                    solid
                    understanding of Python and its applications in data science.
                </p>
                <img src="../Assets/Images/CH.png" alt="">
                <ol>
                    <li>x</li>
                    <li>x</li>
                    <li>x</li>
                    <li>x</li>
                </ol>
                <ul>
                    <li>x</li>
                    <li>x</li>
                    <li>x</li>
                    <li>x</li>
                    <li>x</li>
                </ul>
                <blockquote>
                    This course is designed to take you from a beginner to an advanced level in Python for Data Science.
                    You
                    will learn the fundamentals of Python programming, data manipulation, data visualization, and
                    machine
                    learning. By the end of this course, you will have a solid understanding of Python and its
                    applications in
                    data science.
                    You will learn the fundamentals of Python programming, data manipulation, data visualization, and
                    machine
                    learning. By the end of this course, you will have a solid understanding of Python and its
                    applications in
                    data science.
                </blockquote>
                <p>For more information, visit the <a href="https://www.nxtwave.ai/">Nxt Wave</a> website.</p>
                <pre>
                    def hello_world():
                        print("Hello, World!")
                </pre>
            </div>
        </div>
    </div>
    <div class="container py-4">
        <!-- Discussion more Info -->
        <div class="editor-wrapper mb-3">
            <!-- Create Editor Container -->
            <div id="editor-container"></div>
        </div>
        <!-- Quill JS -->
        <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
        <script>
            // Initialize Quill editor
            const quill = new Quill('#editor-container', {
                theme: 'snow',
                placeholder: 'Write your course content here...',
                modules: {
                    toolbar: {
                        container: [
                            [{ 'header': [1, 2, 3, 4, false] }],
                            ['bold', 'italic', 'blockquote'],
                            [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                            ['link', 'image', 'code-block'],
                        ],
                        handlers: {
                            image: imageHandler
                        }
                    }
                }
            });

            // Custom image handler
            function imageHandler() {
                const input = document.createElement('input');
                input.setAttribute('type', 'file');
                input.setAttribute('accept', 'image/*');
                input.click();

                input.onchange = () => {
                    const file = input.files[0];
                    if (file) {
                        // Show loading state
                        const range = quill.getSelection();
                        quill.insertText(range.index, 'Uploading image...');

                        // In a real app, you would upload to a server here
                        // For demo, we'll use FileReader
                        const reader = new FileReader();
                        reader.onload = (e) => {
                            // Remove loading text
                            quill.deleteText(range.index, 16);
                            // Insert image
                            quill.insertEmbed(range.index, 'image', e.target.result);
                            quill.setSelection(range.index + 1);
                        };
                        reader.readAsDataURL(file);
                    }
                };
            }
        </script>
        <div class="d-flex flex-row justify-content-end mb-5">
            <form action="" id="s" method="post">
                <div class="d-none">
                    <input type="text" name="userId" value="1">
                    <input type="text" name="disscussion">
                </div>
                <button type="submit" class="btn lightBlueBG px-3 py-1 m-0">Add Now</button>
            </form>
        </div>
    </div>
    <script>
        document.getElementById('s').addEventListener("submit", function (event) {
            event.preventDefault(); // Prevent the default form submission

            // Get the content of the editor
            const content = quill.root.innerHTML;

            // Set the value of the hidden input field to the editor content
            document.querySelector('input[name="disscussion"]').value = content;

            // Submit the form
            this.submit();
        })
    </script>
</body>

</html>