import resume from '../pdf/mischaikow_resume.pdf'

const Homepage = () => {
    const linkStyle = {
        fontFamily: "Open Sans, sans-serif",
        fontWeight: 600,
        textDecoration: "none",
    }

    return (
        <>
            <h1>Chris Mischaikow</h1>
            <h4>Fullstack software developer with a background in data science and economics</h4>
            <div id="navcontainer">
                <ul id="navlist">
                    <li>
                        <a href="https://linkedin.com/in/mischaikow/" title="LinkedIn" style={linkStyle}>LinkedIn</a>
                    </li>
                    <li>
                        <a href="https://github.com/mischaikow/" title="GitHub" style={linkStyle}>GitHub</a>
                    </li>
                    <li>
                        <a href={resume} title="Resume" style={linkStyle} download>Resume</a>
                    </li>
                </ul>
            </div>
        </>
    )
}

export default Homepage;