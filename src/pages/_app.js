import '../styles/globals.css'
import { CssBaseline, StyledEngineProvider } from '@mui/material'

function MyApp({ Component, pageProps }) {
    return (
        <StyledEngineProvider injectFirst>
            <CssBaseline />
            <Component {...pageProps} />
        </StyledEngineProvider>
    )
}

export default MyApp
